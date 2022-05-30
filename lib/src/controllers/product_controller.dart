import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/controllers/transaction_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_type/product_type.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

///
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
  final FireBaseRepository _api = FireBaseRepository('products');

  ///

  ///
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

  /// Product
  List<Product> get filteredProducts => _filteredProducts;

  ///Filtering list of products by category or name
  void filteredProductsByNameAndCategory({String? query}) {
    final stock = Get.find<TransactionController>().getTransactionSummary();
    final allProducts =
        products.map((p) => productWithLatestInfo(p, stock)).toList();
    _filteredProducts = allProducts;
    if (query != null) {
      final newproducts = <Product>[];
      for (final product in _filteredProducts) {
        if ((product.type != null &&
                product.type!.name
                    .toLowerCase()
                    .contains(query.toLowerCase())) ||
            product.name.toLowerCase().contains(query.toLowerCase())) {
          newproducts.add(product);
        }
      }
      _filteredProducts = newproducts;
    }
    update();
  }

  ///
  ProductSortEnum _sortEnum = ProductSortEnum.a2z;

  ///
  ProductSortEnum get sortEnum => _sortEnum;

  ///
  int? _safetyQuantity;

  ///
  int? get safetyQuantity => _safetyQuantity;

  ///
  set safetyQuantity(int? q) {
    _safetyQuantity = q;
    update();
  }

  ///
  ProductType? _productType;

  ///
  ProductType? get productType => _productType;

  ///
  set productType(ProductType? q) {
    _productType = q;
    update();
  }

  ///
  int? _currentStockQuantity;

  ///
  int? get currentStockQuantity => _currentStockQuantity;

  ///
  set currentStockQuantity(int? q) {
    _currentStockQuantity = q;
    update();
  }

  /// Future Products
  Future<void> fetchProducts() async {
    busy = true;
    final objs = await _api.allItems();
    busy = false;
    final ps = <Product>[];
    for (final item in objs) {
      ps.add(Product.fromJson(item));
    }
    // products = ps;
  }

  /// Add a product to a current products state
  Future<void> addProduct(Product product) async {
    loadDialog<void>(loadingText: 'Adding Product ....');
    final productMap = product.toJson();
    productMap['createdAt'] = DateTime.now();
    if (currentStockQuantity != null) {
      productMap['currentStock'] = currentStockQuantity ?? 0;
    }
    if (productType != null) {
      productMap['type'] = productType?.toJson();
    }

    if (safetyQuantity != null) {
      productMap['safetyStock'] = safetyQuantity ?? 0;
    }
    final success = await _api.addOne(productMap);
    Get.back<void>();
    if (success) {
      Get.back<void>();
      // ignore: cascade_invocations
      Get.snackbar(
        'Item',
        'Added Successful',
        snackPosition: SnackPosition.BOTTOM,
      );
      resetValues(success: success);
    } else {
      Get.snackbar(
        'Item',
        'Failed to add',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Update a product to a current products state
  Future<void> updateProductSafetyStock(Product prod, int safetStock) async {
    loadDialog<dynamic>(
      loadingText: 'Updating Safety ...',
    );
    final productToUpdate = Product(
      id: prod.id,
      name: prod.name,
      safetyStock: safetStock,
      updatedAt: DateTime.now(),
    );

    final success = await _api.updateOne(productToUpdate.toJson());
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

  /// Update a product to a current products state
  Future<void> updateProduct(Product product) async {
    loadDialog<void>(loadingText: 'Updating Product...');
    final productMap = product.toJson();
    if (currentStockQuantity != null) {
      productMap[' currentStock'] = currentStockQuantity ?? 0;
    }
    if (productType != null) {
      productMap['type'] = productType?.toJson();
    }
    if (safetyQuantity != null) {
      productMap['safetyStock'] = safetyQuantity ?? 0;
    }
    productMap['updatedAt'] = DateTime.now();

    final success = await _api.updateOne(productMap);
    Get.back<void>();
    if (success) {
      Get.back<void>();

      // ignore: cascade_invocations
      Get.snackbar('Product', 'Updated Successful');
    }
  }

  /// Remove product from a current products state
  Future<void> removeProduct() async {
    loadDialog<void>(loadingText: 'Deleting Product ....');
    final success = await _api.removeOne(product!.toJson());
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

  /// Fetching stream of data
  Stream<List<Product>> fetchProductsAsStream() {
    return _api.streamDataCollection().map(
          (maps) => maps.map((item) {
            return Product.fromJson(item);
          }).toList(),
        );
  }

  ///
  void resetValues({required bool success}) {
    if (success) {
      safetyQuantity = null;
      currentStockQuantity = null;
      productType = null;
      Get.snackbar(
        'Product',
        'Successful',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Product',
        'Failed',
        snackPosition: SnackPosition.BOTTOM,
      );
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
