import 'package:get/get.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/stock/stock.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

///
class BaseController extends GetxController {
  final FireBaseRepository _productApi = FireBaseRepository('products');
  final FireBaseRepository _summaryApi = FireBaseRepository('summary');

  ///
  Rx<List<Product>> productList = Rx<List<Product>>([]);

  ///
  List<Product> get products => productList.value;

  ///
  final Rx<Stock?> _currentSummary = Rx(
    initiaStock,
  );

  ///
  Stock? get currentStock => _currentSummary.value;

  @override
  void onReady() {
    productList.bindStream(
      _productApi.streamDataCollection().map(
            (maps) => maps.map((item) {
              return Product.fromJson(item);
            }).toList(),
          ),
    );

    /// Current Products Summary

    _currentSummary.bindStream(_summaryApi
        .streamDataCollectionWhereDoc(docId: 'transaction')
        .map((mapData) => mapData != null ? Stock.fromJson(mapData) : null));
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
