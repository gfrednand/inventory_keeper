import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/stock/stock.dart';

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
  double _totalAmount = 0;

  ///
  double get totalAmount => _totalAmount;

  ///
  void calculateTotalQuantity() {
    var quantity = 0;
    var total = 0.0;
    _items.forEach((key, cartItem) {
      quantity += cartItem.selectedQuantity;
      total += cartItem.amount * cartItem.selectedQuantity;
    });
    _totalQuantity = quantity;
    _totalAmount = total;
    update();
  }

  /// Adding item to cart
  void addItem(
      {required String id,
      required String name,
      int? selectedQuantity,
      required int currentQuantity,
      required bool isIncoming,
      double? amount,
      bool? active,
      DateTime? summaryDate}) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existingCartItem) => ProductSummary(
          id: existingCartItem.id,
          name: existingCartItem.name,
          summaryDate: existingCartItem.summaryDate,
          currentQuantity: existingCartItem.currentQuantity,
          selectedQuantity:
              selectedQuantity ?? existingCartItem.selectedQuantity,
          amount: amount ?? existingCartItem.amount,
          isIncoming: existingCartItem.isIncoming,
          active: existingCartItem.active,
        ),
      );
    } else {
      _items.putIfAbsent(
        id,
        () => ProductSummary(
          id: id,
          name: name,
          summaryDate: summaryDate ?? DateTime.now(),
          currentQuantity: currentQuantity,
          selectedQuantity: selectedQuantity ?? 0,
          isIncoming: isIncoming,
          amount: amount ?? 0,
          active: active ?? true,
        ),
      );
    }
    if (selectedQuantity == 0) {
      removeitem(id);
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
