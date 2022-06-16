import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_category/product_category.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';

/// ProductCategory Controller
class ProductCategoryController extends BaseController {
  ///ProductCategoryController instance
  static ProductCategoryController instance = Get.find();

  ///
  final RxInt _lastUpdatedAt = 0.obs;

  /// Last Updated At
  int get lastUpdatedAt => _lastUpdatedAt.value;

  /// Set Last Updated At
  set lastUpdatedAt(int value) {
    _lastUpdatedAt(value);
  }

  ///
  ProductCategory? get type => _type;

  ProductCategory? _type;

  List<ProductCategory> _filteredproductCategories = [];

  /// Filtered all types used
  List<ProductCategory> get filteredproductCategories =>
      _filteredproductCategories;

  /// Product categories
  void changeType(ProductCategory? newType) {
    if ((type?.name == newType?.name) || newType == null) {
      _type = null;
    } else {
      _type = newType;
    }

    update();
  }

  ///
  Rx<List<ProductCategory>> productCategoryList = Rx<List<ProductCategory>>([]);

  ///
  List<ProductCategory> _productCategories = [];

  ///
  List<ProductCategory> get productCategories => _productCategories;
  @override
  void onReady() {
    ever(_lastUpdatedAt, fetchData);
  }

  ///
  TextEditingController nameController = TextEditingController();

  ///
  FocusNode nameFocusNode = FocusNode();

  /// Future Items
  Future<void> fetchData(int? lastUpdatedAt) async {
    final datas = <ProductCategory>[];
    QuerySnapshot<Object?> snapShot;
    if (teamId != null) {
      busy = true;
      if (lastUpdatedAt != null && _productCategories.isNotEmpty) {
        snapShot = await categoryCollectionRef(teamId!)
            .where('lastUpdatedAt', isEqualTo: lastUpdatedAt)
            .get();
      } else {
        snapShot = await categoryCollectionRef(teamId!).get();
      }
      for (final doc in snapShot.docs) {
        final json = doc.data()! as Map<String, dynamic>;
        json['id'] = doc.id;
        datas.add(ProductCategory.fromJson(json));
      }
      _productCategories = _productCategories..addAll(datas);
      final seen = <String>{};
      _productCategories =
          _productCategories.where((cat) => seen.add(cat.id ?? '')).toList();

      busy = false;
    }
  }

  /// Add a product to a current productCategories state
  Future<void> addProductCategory() async {
    if (teamId != null) {
      final map = <String, dynamic>{
        'teamId': teamId,
        'userId': firebaseAuth.currentUser!.uid,
        'name': nameController.text,
        'lastUpdatedAt': DateTime.now().millisecondsSinceEpoch
      };

      final success = await categoryCollectionRef(teamId!)
          .add(map)
          .then((value) => true)
          .catchError((dynamic error) {
        print('Failed to add data: ${error.toString()}');
        return false;
      });
      if (success) {
        nameController.text = '';
      }

      // if (success) _productCategories.add(newProduct);
      // notifyListeners();
    }
  }

  /// Remove product from a current productCategories state
  Future<void> removeProductCategory(ProductCategory item) async {
    if (teamId != null) {
      final success = await categoryCollectionRef(teamId!)
          .doc(item.id)
          .delete()
          .then((value) => true)
          .catchError((dynamic error) {
        print('Failed to delete user: $error');
        return false;
      });
      if (success) {
        // final index = _productCategories.indexWhere((p) => p.id == item.id);
        // _productCategories.removeAt(index);
      }
      update();
    }
  }

  ///
  void getProductCategories(List<Product> allProducts) {
    if (allProducts.isNotEmpty) {
      final types = <ProductCategory>[];
      for (final product in allProducts) {
        final type = productCategories
            .firstWhereOrNull((type) => type.name == product.category?.name);
        if (type != null) {
          types.add(type);
        }
      }
      _filteredproductCategories = types;
    } else {
      _filteredproductCategories = productCategories;
    }
    // update();
  }
}
