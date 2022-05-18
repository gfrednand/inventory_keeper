import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/product_type/product_type.dart';

/// ProductType Controller
class ProductTypeController extends BaseController {
  final FireBaseRepository _api = FireBaseRepository('productTypes');

  ///
  TextEditingController nameController = TextEditingController();

  ///
  FocusNode nameFocusNode = FocusNode();

  List<ProductType> _productTypes = [];

  /// Get productTypes from current productTypes state
  List<ProductType> get productTypes {
    return [..._productTypes];
  }

  set productTypes(List<ProductType> item) {
    _productTypes = item;
    notifyListeners();
  }

  /// Future Items
  Future<List<ProductType>> fetchItems() async {
    busy = true;
    final objs = await _api.allItems();
    busy = false;
    final ps = <ProductType>[];
    for (final item in objs) {
      ps.add(ProductType.fromJson(item));
    }
    _productTypes = ps;
    return ps;
  }

  /// Add a product to a current productTypes state
  Future<void> addProductType() async {
    final map = <String, dynamic>{'name': nameController.text};
    final success = await _api.addOne(map);
    if (success) {
      nameController.text = '';
    }
    // if (success) _productTypes.add(newProduct);
    // notifyListeners();
  }

  /// Update a product to a current productTypes state
  Future<void> updateProductType(ProductType item) async {
    busy = true;
    final success = await _api.updateOne(item.toJson());
    busy = false;
    if (success) _productTypes.add(item);
    notifyListeners();
  }

  /// Remove product from a current productTypes state
  Future<void> removeProductType(ProductType item) async {
    busy = true;
    final success = await _api.removeOne(item.toJson());
    busy = false;
    if (success) {
      // final index = _productTypes.indexWhere((p) => p.id == item.id);
      // _productTypes.removeAt(index);
    }
    notifyListeners();
  }

  /// Fetching stream of data
  Stream<List<ProductType>> fetchProductTypesAsStream() {
    return _api.streamDataCollection().map(
          (maps) => maps.map(ProductType.fromJson).toList(),
        );
  }
}
