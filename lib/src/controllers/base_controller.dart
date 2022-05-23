import 'package:get/get.dart';
import 'package:inventory_keeper/src/models/product/product.dart';

///
class BaseController extends GetxController {
  set products(List<Product> newProducts) {
    _productList = newProducts;
  }

  List<Product> _productList = [];

  /// Get products from current products state
  List<Product> get products {
    return [..._productList];
  }

  bool _busy = false;
  String? _errorMessage;

  /// Is busy
  bool get busy => _busy;

  ///
  String? get errorMessage => _errorMessage;

  ///
  bool get hasErrorMessage => _errorMessage != null && _errorMessage != '';

  ///
  void setErrorMessage(String? message) {
    _errorMessage = message;
  }

  /// Set Busy Status
  set busy(bool value) {
    _busy = value;
  }
}
