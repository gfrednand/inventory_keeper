import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/product_summary/product_summary.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

/// Cart controller
class CartController extends BaseController {
  Map<String, ProductSummary> _items = {};

  /// Get all items in a cart
  Map<String, ProductSummary> get items {
    return {..._items};
  }

  /// Get all items count in a cart
  int get itemCount {
    // return  _items?.length?? 0;
    return _items.length;
  }

  ///
  int _totalQuantity = 0;

  ///
  int get totalQuantity => _totalQuantity;

  ///
  int _totalAuditedQuantity = 0;

  ///
  int get totalAuditedQuantity => _totalAuditedQuantity;

  ///
  double _totalAmount = 0;

  ///
  double get totalAmount => _totalAmount;

  ///
  void calculateTotalQuantity() {
    var quantity = 0;
    var auditedQuantity = 0;
    var total = 0.0;
    _items.forEach((key, cartItem) {
      quantity += cartItem.quantity;
      auditedQuantity += cartItem.auditedQuantity;
      total += cartItem.amount * (cartItem.quantity);
    });
    _totalQuantity = quantity;
    _totalAuditedQuantity = auditedQuantity;
    _totalAmount = total.abs();
    update();
  }

  /// Adding item to cart
  void addItem({
    required String productId,
    int? quantity,
    int? auditedQuantity,
    int? currentStock,
    double? amount,
    bool? active,
    DateTime? summaryDate,
  }) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => ProductSummary(
          teamId: existingCartItem.teamId,
          id: existingCartItem.id,
          productId: existingCartItem.productId,
          lastUpdatedAt: dateToMillSeconds(DateTime.now()),
          currentStock: currentStock ?? existingCartItem.currentStock,
          quantity: quantity ?? existingCartItem.quantity,
          auditedQuantity: auditedQuantity ?? existingCartItem.auditedQuantity,
          amount: amount ?? existingCartItem.amount,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => ProductSummary(
          teamId: teamId ?? '',
          productId: productId,
          lastUpdatedAt: dateToMillSeconds(DateTime.now()),
          currentStock: currentStock ?? 0,
          quantity: quantity ?? 0,
          auditedQuantity: auditedQuantity ?? 0,
          amount: amount ?? 0,
        ),
      );
    }
    if (quantity == 0) {
      removeitem(productId);
    } else {
      calculateTotalQuantity();
    }
  }

  /// Remove item in a cart
  void removeitem(String productId) {
    _items.remove(productId);
    calculateTotalQuantity();
  }

  /// Remove all items in a cart
  void clear() {
    _items = {};
    calculateTotalQuantity();
  }
}
