import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_type/product_type.dart';

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
  Future<bool> addProduct(Product product) async {
    busy = true;
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
    if (success) {
      resetValues(success: success);
    }

    return success;
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
  Future<bool> updateProductSafetyStock(Product prod, int safetStock) async {
    final productToUpdate = Product(
      id: prod.id,
      name: prod.name,
      safetyStock: safetStock,
      updatedAt: DateTime.now(),
    );

    return _api.updateOne(productToUpdate.toJson());
  }

  /// Update a product to a current products state
  Future<bool> updateProduct(Product product) async {
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
    if (success) {
      resetValues(success: success);
    }
    return success;
  }

  /// Remove product from a current products state
  Future<bool> removeProduct() async {
    return _api.removeOne(product!.toJson());
  }

  /// Fetching stream of data
  Stream<List<Product>> fetchProductsAsStream({String? query}) {
    return _api.streamDataCollection(query: query).map(
          (maps) => maps.map((item) {
            return Product.fromJson(item);
          }).toList(),
        );
  }

  ///
  void resetValues({required bool success}) {
    if (success) {
      // type = null;
      safetyQuantity = null;
      currentStockQuantity = null;
      productType = null;
      setErrorMessage(null);
    } else {
      setErrorMessage('Error has occured');
    }
    update();
  }
}
