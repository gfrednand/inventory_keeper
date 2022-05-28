import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_type/product_type.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

///
enum SelectedQuantityEnum {
  ///
  updateStock,

  ///
  updateSafetyStock
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
  // set product(Product? newproduct) {
  //   _product = newproduct;
  //   safetyQuantity = newproduct?.safetyStock;
  //   nameController.text = newproduct?.name ?? '';
  //   salePriceController.text = (newproduct?.salePrice ?? '').toString();
  //   buyPriceController.text = (newproduct?.buyPrice ?? '').toString();
  //   unitController.text = newproduct?.unit ?? '';
  //   currentStockQuantity = newproduct?.currentStock;
  //   update();
  // }

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

  ///
  Future<bool> updateProducts(List<Product> prods) async {
    final prodMap = prods.where((p) => p.isIncomingStock != null).map((p) {
      if (p.id == product?.id) {
        currentStockQuantity = p.currentStock;
      }
      p = p.copyWith(
        updatedAt: DateTime.now(),
      );
      return p.toJson();
    }).toList();
    final success = await _api.updateMany(prodMap);
    // if (success) {
    //   _navigationService
    //       .goBackUntil(ModalRoute.withName(ProductDetails.routeName));
    // }
    return success;
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
}
