import 'package:get/get.dart';
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

  @override
  void onReady() {
    productTransactionList.bindStream(
      fetchStocksAsStream(
        queryMap: <String, dynamic>{
          'parameter': 'transactionDate',
          'value': dateToMillSeconds(DateTime.now())
        },
      ),
    );
  }

  ///
  ProductTransaction? _transaction;

  /// Get all transactions
  ProductTransaction? get transaction => _transaction;

  /// Current Summary Of Stock
  Stock getCurrentStockSummary() {
    var totalIn = 0;
    var totalOut = 0;
    var totalSale = 0.0;
    var totalBuy = 0.0;
    final productTransaction = productTransactions.firstWhereOrNull(
      (transaction) =>
          dateToMillSeconds(DateTime.now()) > transaction.transactionDate,
    );
    if (productTransaction?.productsSummary != null) {
      for (final p in productTransaction!.productsSummary) {
        final summaryDate = dateToMillSeconds(p.summaryDate);
        final today = dateToMillSeconds(DateTime.now());
        if (summaryDate == today &&
            productTransaction.transactionType == TransactionType.inStock) {
          totalIn = totalIn + p.quantity;
          totalBuy = totalBuy + (p.amount ?? 0);
        } else if (summaryDate == today &&
            productTransaction.transactionType == TransactionType.outStock) {
          totalOut = totalOut + p.quantity;
          totalSale = totalSale + (p.amount ?? 0);
        }
      }
    }
    return Stock(
      productsSummary: productTransaction?.productsSummary ?? [],
      totalAmount: productTransaction?.totalAmount ?? 0,
      totalQuantity: productTransaction?.totalQuantity ?? 0,
      totalIn: totalIn,
      totalOut: totalOut,
      totalSale: totalSale,
      totalBuy: totalBuy,
    );
  }

  /// Add transaction
  Future<void> addTransaction({
    required CartController cartController,
    required TransactionType transactionType,
  }) async {
    final prodTnx = ProductTransaction(
      transactionDate: dateToMillSeconds(DateTime.now()),
      transactionType: transactionType,
      totalSelectedQuantity: 0,
      productsSummary: [],
      totalQuantity: cartController.totalQuantity,
      totalAmount: cartController.totalAmount,
    );

    final map = prodTnx.toJson();
    map['productsSummary'] = prodSummaryMap(cartController.items);
    final success = await _api.addOne(map);
    Get.back<void>();

    if (success) {
      cartController.clear();

      Get.snackbar(
        'Transaction',
        'Successful',
        snackPosition: SnackPosition.BOTTOM,
      );
      // ignore: cascade_invocations
      Get.back<void>();
      // ignore: cascade_invocations
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
          'selectedQuantity': e.quantity,
        };
      },
    ).toList();
  }
}
