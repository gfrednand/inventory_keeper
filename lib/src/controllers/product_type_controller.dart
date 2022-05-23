import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/product_type/product_type.dart';

/// ProductType Controller
class ProductTypeController extends BaseController {
  final FireBaseRepository _api = FireBaseRepository('productTypes');

  Rx<ProductType>? type;

  /// Product categories
  void changeType(ProductType? newType) {
    if (type?.value.name == newType?.name) {
      type = null;
    } else if (newType != null) {
      type?.value = newType;
    }
  }

  ///
  Rx<List<ProductType>> productTypeList = Rx<List<ProductType>>([]);

  ///
  List<ProductType> get productTypes => productTypeList.value;
  @override
  void onReady() {
    productTypeList.bindStream(
      _api.streamDataCollection().map(
            (maps) => maps.map((item) {
              return ProductType.fromJson(item);
            }).toList(),
          ),
    );
  }

  ///
  TextEditingController nameController = TextEditingController();

  ///
  FocusNode nameFocusNode = FocusNode();

  /// Future Items
  Future<List<ProductType>> fetchItems() async {
    busy = true;
    final objs = await _api.allItems();
    busy = false;
    final ps = <ProductType>[];
    for (final item in objs) {
      ps.add(ProductType.fromJson(item));
    }
    // _productTypes = ps;
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

  /// Remove product from a current productTypes state
  Future<void> removeProductType(ProductType item) async {
    busy = true;
    final success = await _api.removeOne(item.toJson());
    busy = false;
    if (success) {
      // final index = _productTypes.indexWhere((p) => p.id == item.id);
      // _productTypes.removeAt(index);
    }
    update();
  }
}
