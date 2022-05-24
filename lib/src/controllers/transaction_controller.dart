import 'package:get/get.dart';
import 'package:inventory_keeper/src/models/stock/stock.dart';

/// Transaction controller
class TransactionController extends GetxController {
  ///
  final List<Transaction> _transactions = [];

  /// Get all transactions
  List<Transaction> get transactions {
    return [..._transactions];
  }

  /// Add transaction
  void addTransaction(
      {required List<ProductSummary> cartProducts,
      required double totalAmount,
      required int totalQuantity,
      required bool isIncoming}) {
    _transactions.insert(
        0,
        Transaction(
          isIncoming: isIncoming,
          totalSelectedQuantity: 0,
          createdAt: DateTime.now(),
          productsSummary: cartProducts,
          totalQuantity: totalQuantity,
          totalAmount: totalAmount,
        ));
    update();
  }
}
