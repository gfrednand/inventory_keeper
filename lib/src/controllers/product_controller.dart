import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_category/product_category.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

/// Product Sort Enum
enum ProductSortEnum {
  /// Sort A to Z
  a2z,

  /// Sort Z to A
  z2a,

  /// Sort By Larget No of Stock
  largeStock,

  /// Sort By Lowest No of Stock
  loweStock
}

/// Product Controller
class ProductController extends BaseController {
  ///  Product Controller Instance
  static ProductController instance = Get.find();

  /// Focus node
  FocusNode unitFocusNode = FocusNode(),
      salePriceFocusNode = FocusNode(),
      buyPriceFocusNode = FocusNode(),
      nameFocusNode = FocusNode();

  Product? _product;

  /// Product
  Product? get product => _product;
  set product(Product? newproduct) {
    _product = newproduct;
    update();
  }

  List<Product> _filteredProducts = [];
  List<Product> _products = [];

  /// All Filtered Product
  List<Product> get filteredProducts => _filteredProducts;

  /// All products
  List<Product> get products => _products;

  ///
  final RxInt _lastUpdatedAt = 0.obs;

  /// Last Updated At
  int get lastUpdatedAt => _lastUpdatedAt.value;

  /// Set Last Updated At
  set lastUpdatedAt(int value) {
    _lastUpdatedAt(value);
  }

  @override
  void onReady() {
    ever(_lastUpdatedAt, fetchData);
  }

  ///Filtering list of products by category or name
  void filteredProductsByNameAndCategory({String? query}) {
    if (query != null) {
      final newproducts = <Product>[];
      for (final product in _products) {
        if ((product.category != null &&
                product.category!.name
                    .toLowerCase()
                    .contains(query.toLowerCase())) ||
            product.name.toLowerCase().contains(query.toLowerCase())) {
          newproducts.add(product);
        }
      }
      _filteredProducts = newproducts;
    } else {
      _filteredProducts = _products;
    }
    update();
  }

  /// Sort Enum
  ProductSortEnum _sortEnum = ProductSortEnum.a2z;

  ///
  ProductSortEnum get sortEnum => _sortEnum;

  ///  Safety Quantity
  int? _safetyQuantity;

  ///
  int? get safetyQuantity => _safetyQuantity;

  ///
  set safetyQuantity(int? q) {
    _safetyQuantity = q;
    update();
  }

  ///
  ProductCategory? _productCategory;

  ///
  ProductCategory? get productCategory => _productCategory;

  ///
  set productCategory(ProductCategory? q) {
    _productCategory = q;
    update();
  }

  ///
  int? _currentStock;

  ///
  int? get currentStock => _currentStock;

  ///
  set currentStock(int? q) {
    _currentStock = q;
    update();
  }

  /// Future Products
  Future<void> fetchData(int? lastUpdatedAt) async {
    if (teamId != null) {
      busy = true;
      final datas = <Product>[];
      QuerySnapshot<Object?> snapShot;
      if (lastUpdatedAt != null && _products.isNotEmpty) {
        snapShot = await productsCollectionRef(teamId!)
            .where('lastUpdatedAt', isEqualTo: lastUpdatedAt)
            .get();
      } else {
        snapShot = await productsCollectionRef(teamId!).get();
      }
      for (final doc in snapShot.docs) {
        final json = doc.data()! as Map<String, dynamic>;
        json['id'] = doc.id;
        datas.add(Product.fromJson(json));
      }
      _products = _products..addAll(datas);
      final seen = <String>{};
      _products = _products.where((cat) => seen.add(cat.id ?? '')).toList();

      busy = false;
    }
  }

  /// Add a product to a current products state
  Future<void> addProduct(Product product) async {
    if (teamId != null) {
      loadDialog<void>(loadingText: 'Adding Product ....');
      final productMap = product.toJson();
      productMap['teamId'] = teamId;
      if (currentStock != null) {
        productMap['currentStock'] = currentStock ?? 0;
      }
      if (productCategory != null) {
        productMap['category'] = productCategory?.toJson();
      }

      if (safetyQuantity != null) {
        productMap['safetyQuantity'] = safetyQuantity ?? 0;
      }
      final success = await productsCollectionRef(teamId!)
          .add(productMap)
          .then((value) => true)
          .catchError((dynamic error) {
        print('Failed to add data: ${error.toString()}');
        return false;
      });

      Get.back<void>();
      if (success) {
        Get.back<void>();
        filteredProductsByNameAndCategory();
        Get.snackbar(
          'Item',
          'Added Successful',
          // snackPosition: SnackPosition.BOTTOM,
        );
        resetValues(success: success);
      } else {
        Get.snackbar(
          'Item',
          'Failed to add',
          // snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  /// Update a product to a current products state
  Future<void> updateProductSafetyStock(
      Product prod, int safetyQuantity) async {
    if (teamId != null) {
      loadDialog<dynamic>(
        loadingText: 'Updating Safety ...',
      );
      final productToUpdate = Product(
          teamId: teamId ?? '',
          id: prod.id,
          userId: firebaseAuth.currentUser!.uid,
          name: prod.name,
          safetyQuantity: safetyQuantity,
          lastUpdatedAt: DateTime.now().millisecondsSinceEpoch);

      final success = await productsCollectionRef(teamId!)
          .doc(prod.id)
          .set(productToUpdate, SetOptions(merge: true))
          .then((value) => true)
          .catchError((dynamic error) {
        print('Failed to update user: $error');
        return false;
      });

      Get.back<void>();

      if (success) {
        Get.snackbar(
          'Safety Stock',
          'Successful Updated',
        );
      } else {
        Get.snackbar(
          'Safety Stock',
          'Failed to Updated',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  /// Update a product to a current products state
  Future<void> updateProduct(Product product) async {
    if (teamId != null) {
      loadDialog<void>(loadingText: 'Updating Product...');
      final productMap = product.toJson();
      productMap['teamId'] = teamId;
      if (currentStock != null) {
        productMap[' currentStock'] = currentStock ?? 0;
      }
      if (productCategory != null) {
        productMap['category'] = productCategory?.toJson();
      }
      if (safetyQuantity != null) {
        productMap['safetyQuantity'] = safetyQuantity ?? 0;
      }
      productMap['lastUpdatedAt'] = DateTime.now().millisecondsSinceEpoch;

      final success = await productsCollectionRef(teamId!)
          .doc(product.id)
          .set(productMap, SetOptions(merge: true))
          .then((value) => true)
          .catchError((dynamic error) {
        print('Failed to update user: $error');
        return false;
      });
      Get.back<void>();
      if (success) {
        Get.back<void>();

        // ignore: cascade_invocations
        Get.snackbar('Product', 'Updated Successful');
      }
    }
  }

  /// Remove product from a current products state
  Future<void> removeProduct() async {
    if (teamId != null) {
      loadDialog<void>(loadingText: 'Deleting Product ....');
      final success = await productsCollectionRef(teamId!)
          .doc(product?.id)
          .delete()
          .then((value) => true)
          .catchError((dynamic error) {
        print('Failed to delete user: $error');
        return false;
      });
      Get.back<void>();
      if (success) {
        Get.back<void>();
        // ignore: cascade_invocations
        Get.snackbar('Product', 'Deleted Successful');
      } else {
        Get.back<void>();
        // ignore: cascade_invocations
        Get.snackbar('Product', 'Failed to Delete');
      }
    }
  }

  ///
  void resetValues({required bool success}) {
    if (success) {
      safetyQuantity = null;
      currentStock = null;
      productCategory = null;
    }
    update();
  }

  ///
  void sortProducts(ProductSortEnum sortEnum) {
    _sortEnum = sortEnum;
    switch (sortEnum) {
      case ProductSortEnum.a2z:
        filteredProducts.sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
        break;
      case ProductSortEnum.z2a:
        filteredProducts.sort(
          (a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()),
        );
        break;
      case ProductSortEnum.largeStock:
        filteredProducts.sort(
          (a, b) => b.currentStock.compareTo(a.currentStock),
        );
        break;
      case ProductSortEnum.loweStock:
        filteredProducts.sort(
          (a, b) => a.currentStock.compareTo(b.currentStock),
        );
    }
    update();
  }
}
