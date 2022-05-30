import 'package:get/get.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';

///
class BaseController extends GetxController {
  final FireBaseRepository _productApi = FireBaseRepository('products');

  ///
  Rx<List<Product>> productList = Rx<List<Product>>([]);

  ///
  List<Product> get products => productList.value;
  @override
  void onReady() {
    productList.bindStream(
      _productApi.streamDataCollection().map(
            (maps) => maps.map((item) {
              return Product.fromJson(item);
            }).toList(),
          ),
    );
  }

  bool _busy = false;
  String? _errorMessage;

  /// Is busy
  bool get busy => _busy;

  ///

  ///
  bool get hasErrorMessage => _errorMessage != null && _errorMessage != '';

  ///

  /// Set Busy Status
  set busy(bool value) {
    _busy = value;
    update();
  }
}
