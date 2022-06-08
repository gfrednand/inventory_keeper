import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/controllers/cart_controller.dart';
import 'package:inventory_keeper/src/models/product_summary/product_summary.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
import 'package:inventory_keeper/src/models/stock/stock.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

/// Transaction controller
class TransactionController extends BaseController {
  final FireBaseRepository _api = FireBaseRepository('transactions');

  ///
  Rx<List<ProductTransaction>> productTransactionList =
      Rx<List<ProductTransaction>>([]);

  ///
  List<ProductTransaction> get productTransactions =>
      productTransactionList.value;

  ///

  String? _summaryDate;

  ///
  String? get summaryDate => _summaryDate;

  ///Past transaction date
  DateTime? _pastTransactionDate;

  ///
  DateTime? get pastTransactionDate => _pastTransactionDate;

  Stock? _stockSummary;

  /// Transaction Summary by Given Date
  Stock? get stockSummary => _stockSummary;

  ///
  ProductTransaction? _transaction;

  /// Get all transactions
  ProductTransaction? get transaction => _transaction;

  ///For filtering transactions
  TransactionType _transactionFilterType = TransactionType.all;

  ///For filtering transactions
  TransactionType get transactionFilterType => _transactionFilterType;

  ///For filtering transactions
  DateTime? _transactionFilterStartDate;

  ///For filtering transactions
  DateTime? get transactionFilterStartDate => _transactionFilterStartDate;

  ///For filtering transactions
  DateTime? _transactionFilterEndDate;

  ///For filtering transactions
  DateTime? get transactionFilterEndDate => _transactionFilterEndDate;

  /// Current Summary Of Stock
  Stock getTransactionSummary({
    DateTime? filterDate,
    List<ProductTransaction>? transactions,
  }) {
    var totalIn = 0;
    var totalOut = 0;
    var totalSale = 0.0;
    var totalBuy = 0.0;
    var allTotalAmount = 0.0;
    var allTotalQuantity = 0;
    final productsSummary = <ProductSummary>[];
    transactions?.sort(
      (a, b) => (a.productsSummary[0].summaryDate ?? DateTime.now())
          .compareTo(b.productsSummary[0].summaryDate ?? DateTime.now()),
    );
    productTransactions.sort(
      (a, b) => (a.productsSummary[0].summaryDate ?? DateTime.now())
          .compareTo(b.productsSummary[0].summaryDate ?? DateTime.now()),
    );
    for (final tr in transactions ?? productTransactions) {
      final prodSummary = [...tr.productsSummary];

      final summaryDate = tr.transactionDate;
      final today = dateToMillSeconds(filterDate ?? DateTime.now());
      allTotalAmount = allTotalAmount + tr.totalAmount;
      allTotalQuantity =
          allTotalQuantity + tr.totalQuantity + tr.totalAuditedQuantity;
      if (summaryDate == today &&
          tr.transactionType == TransactionType.inStock) {
        totalIn = totalIn + tr.totalQuantity;
        totalBuy = totalBuy + (tr.totalAmount);
      } else if (summaryDate == today &&
          tr.transactionType == TransactionType.outStock) {
        totalOut = totalOut + tr.totalQuantity;
        totalSale = totalSale + (tr.totalAmount);
      }
      prodSummary.sort((a, b) {
        return (a.summaryDate ?? DateTime.now())
            .compareTo(b.summaryDate ?? DateTime.now());
      });
      for (final summary in prodSummary) {
        final index =
            productsSummary.indexWhere((summary) => summary.id == summary.id);
        if (index == -1) {
          productsSummary.add(summary);
        } else {
          productsSummary[index] = productsSummary[index].copyWith(
            amount:
                (productsSummary[index].amount ?? 0) + (summary.amount ?? 0),
            quantity: tr.transactionType == TransactionType.audit
                ? summary.quantity
                : productsSummary[index].quantity + summary.quantity,
            currentStock: tr.transactionType == TransactionType.audit
                ? summary.quantity
                : productsSummary[index].currentStock + summary.quantity,
          );
        }
      }
    }

    return Stock(
      productsSummary: productsSummary,
      totalAmount: allTotalAmount,
      totalQuantity: allTotalQuantity,
      totalIn: totalIn,
      totalOut: totalOut,
      totalSale: totalSale,
      totalBuy: totalBuy,
    );
  }

  /// Add transaction
  Future<void> addTransaction(
      {required CartController cartController,
      required TransactionType transactionType,
      DateTime? transactionDate}) async {
    loadDialog<void>(loadingText: 'Updating stock...');
    final prodTnx = ProductTransaction(
      transactionDate: dateToMillSeconds(transactionDate ?? DateTime.now()),
      transactionType: transactionType,
      productsSummary: [],
      totalAuditedQuantity: cartController.totalAuditedQuantity,
      totalQuantity: cartController.totalQuantity,
      totalAmount: cartController.totalAmount,
    );

    final map = prodTnx.toJson();
    map['productsSummary'] = prodSummaryMap(cartController.items);
    final success = await _api.addOne(map);
    Get.back<void>();
    if (success) {
      cartController.clear();
      Get.back<void>();
    } else {
      Get.snackbar(
        'Transaction',
        'Failed',
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    update();
  }

  /// Get Past Transaction Summary By Date
  Future<void> previousTransactionSummary({
    DateTime? date,
    QueryWhereCondition? condition,
  }) async {
    final tnx = <ProductTransaction>[];
    Map<String, dynamic>? queryMap;
    if (date != null) {
      _summaryDate = DateFormat.yMMMEd().format(date);
      queryMap = <String, dynamic>{
        'parameter': 'transactionDate',
        'value': dateToMillSeconds(date)
      };
    }
    final objs = await _api.allItems(queryMap: queryMap, condition: condition);

    busy = false;
    for (final item in objs) {
      tnx.add(ProductTransaction.fromJson(item));
    }

    productTransactionList.value = tnx;
  }

  /// Fetching stream of data
  Stream<List<ProductTransaction>> fetchStocksAsStream({
    Map<String, dynamic>? queryMap,
  }) {
    return _api.streamDataCollection(queryMap: queryMap).map(
          (maps) => maps.map(ProductTransaction.fromJson).toList(),
        );
  }

  ///
  List<Map<String, dynamic>> prodSummaryMap(Map<String, ProductSummary> map) {
    return map.values.map(
      (e) {
        return {
          'active': e.active,
          'amount': e.amount,
          'id': e.id,
          'name': e.name,
          'summaryDate': e.summaryDate,
          'currentStock': e.currentStock,
          'auditedQuantity': e.auditedQuantity,
          'quantity': e.quantity,
        };
      },
    ).toList();
  }

  /// Setting filter type
  set transactionFilterType(TransactionType type) {
    _transactionFilterType = type;
    update();
  }

  /// Setting filter start date
  set transactionFilterStartDate(DateTime? type) {
    _transactionFilterStartDate = type;
    update();
  }

  /// Setting filter end date
  set transactionFilterEndDate(DateTime? type) {
    _transactionFilterEndDate = type;
    update();
  }

  /// Setting filter end date
  set pastTransactionDate(DateTime? type) {
    _pastTransactionDate = type;
    update();
  }

  ///Clearing all filters
  void clearAllFilters() {
    _transactionFilterType = TransactionType.all;
    clearDateFilter();
  }

  /// Clear date filters
  void clearDateFilter() {
    _transactionFilterStartDate = null;
    _transactionFilterEndDate = null;
    update();
  }
}
