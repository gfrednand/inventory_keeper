import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/controllers/cart_controller.dart';
import 'package:inventory_keeper/src/models/product_summary/product_summary.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

///Product Transaction Controller
class ProductTransactionController extends BaseController {
  ///Product Transaction Controller Instance
  static ProductTransactionController instance = Get.find();

  ///
  List<ProductTransaction> _productTransactions = [];

  ///
  List<ProductTransaction> get productTransactions => _productTransactions;

  ///
  ProductTransaction? _previousProductTransaction;

  ///
  ProductTransaction? get previousProductTransaction =>
      _previousProductTransaction;

  ///
  final RxInt _lastUpdatedAt = 0.obs;

  /// Last Updated At
  int get lastUpdatedAt => _lastUpdatedAt.value;

  ///

  String? _summaryDate;

  ///
  String? get summaryDate => _summaryDate;

  ///Past transaction date
  DateTime? _pastTransactionDate;

  ///
  DateTime? get pastTransactionDate => _pastTransactionDate;

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

  /// Set Last Updated At
  set lastUpdatedAt(int value) {
    _lastUpdatedAt(value);
  }

  @override
  void onReady() {
    ever(_lastUpdatedAt, fetchData);
  }

  /// Future Items
  Future<void> fetchData(int? lastUpdatedAt) async {
    if (teamId != null) {
      final datas = <ProductTransaction>[];
      QuerySnapshot<Object?> snapShot;
      if (lastUpdatedAt != null) {
        snapShot = await productTransactionsCollectionRef(teamId!)
            .where('lastUpdatedAt', isEqualTo: lastUpdatedAt)
            .get();
      } else {
        snapShot = await productTransactionsCollectionRef(teamId!).get();
      }
      for (final doc in snapShot.docs) {
        final json = doc.data()! as Map<String, dynamic>;
        json['id'] = doc.id;
        datas.add(ProductTransaction.fromJson(json));
      }
      _productTransactions = datas;
      update();
    }
  }

  /// Get Past Transaction Summary By Date
  Future<void> previousTransactionSummary({
    required DateTime date,
  }) async {
    if (teamId != null) {
      final datas = <ProductTransaction>[];
      _summaryDate = DateFormat.yMMMEd().format(date);

      final snapShot = await productTransactionsCollectionRef(teamId!)
          .where('transactionDate', isEqualTo: dateToMillSeconds(date))
          .get();

      for (final doc in snapShot.docs) {
        final json = doc.data()! as Map<String, dynamic>;
        json['id'] = doc.id;
        datas.add(ProductTransaction.fromJson(json));
      }
      _previousProductTransaction = datas[0];
      update();
    }
  }

  /// Add transaction
  Future<void> addTransaction({
    required CartController cartController,
    required TransactionType transactionType,
    DateTime? transactionDate,
  }) async {
    if (teamId != null) {
      loadDialog<void>(loadingText: 'Updating stock...');
      final prodTnx = ProductTransaction(
        teamId: teamId ?? '',
        userId: firebaseAuth.currentUser!.uid,
        transactionType: transactionType,
        productsSummary: [],
        totalAuditQuantity: cartController.totalAuditedQuantity,
        totalQuantity: cartController.totalQuantity,
        totalAmount: cartController.totalAmount,
        lastUpdatedAt: dateToMillSeconds(transactionDate ?? DateTime.now()),
        transactionDate: dateToMillSeconds(transactionDate ?? DateTime.now()),
      );

      final map = prodTnx.toJson();
      map['productsSummary'] = prodSummaryMap(cartController.items);
      final success = await productTransactionsCollectionRef(teamId!)
          .add(map)
          .then((value) => true)
          .catchError((dynamic error) {
        print('Failed to add data: ${error.toString()}');
        return false;
      });
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
  }

  ///
  List<Map<String, dynamic>> prodSummaryMap(Map<String, ProductSummary> map) {
    return map.values.map(
      (e) {
        return {
          'amount': e.amount,
          'id': e.id,
          'productId': e.productId,
          'lastUpdatedAt': e.lastUpdatedAt,
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
