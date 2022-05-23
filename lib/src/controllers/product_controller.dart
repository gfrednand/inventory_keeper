import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/locator.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_type/product_type.dart';
import 'package:inventory_keeper/src/services/navigation_service.dart';

///
enum SelectedQuantityEnum {
  ///
  updateStock,

  ///
  updateSafetyStock
}

/// Product Controller
class ProductController extends BaseController {
  // set products(List<Product> newProducts) {
  //   _products = newProducts;
  // }

  // List<Product> _products = [];

  // List<Product> get productsFromFetch {
  //   return [..._products];
  // }

  final NavigationService _navigationService = locator<NavigationService>();
  final FireBaseRepository _api = FireBaseRepository('products');

  ///
  TextEditingController nameController = TextEditingController(text: ''),
      salePriceController = TextEditingController(),
      buyPriceController = TextEditingController(),
      unitController = TextEditingController();

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
    safetyQuantity = newproduct?.safetyStock;
    nameController.text = newproduct?.name ?? '';
    salePriceController.text = (newproduct?.salePrice ?? '').toString();
    buyPriceController.text = (newproduct?.buyPrice ?? '').toString();
    unitController.text = newproduct?.unit ?? '';
    currentStockQuantity = newproduct?.currentStock;
    update();
  }

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
  Future<bool> addProduct() async {
    var newProduct = generateProduct();
    busy = true;
    newProduct = newProduct.copyWith(createdAt: DateTime.now());

    final success = await _api.addOne(newProduct.toJson());
    if (success) {
      resetValues(success, null);
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
  Future<Product?> updateProduct() async {
    var updateProduct = generateProduct();
    if (updateProduct != _product) {
      updateProduct = updateProduct.copyWith(
        id: product?.id,
        updatedAt: DateTime.now(),
      );

      final success = await _api.updateOne(updateProduct.toJson());
      if (success) {
        product = updateProduct;
        return updateProduct;
      }
    }
    return null;
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
  Product generateProduct() {
    var newProduct = Product(
      name: nameController.text,
      unit: unitController.text,
      // type: type?.value,
      salePrice: double.tryParse(salePriceController.text) ?? 0,
      buyPrice: double.tryParse(buyPriceController.text) ?? 0,
    );

    if (currentStockQuantity != null) {
      newProduct = newProduct.copyWith(
        currentStock: currentStockQuantity ?? 0,
      );
    }

    if (safetyQuantity != null) {
      newProduct = newProduct.copyWith(safetyStock: safetyQuantity ?? 0);
    }

    return newProduct;
  }

  ///
  void resetValues(bool success, Product? p) {
    if (success) {
      nameController.text = '';
      unitController.text = '';
      salePriceController.text = '';
      // type = null;
      safetyQuantity = null;
      currentStockQuantity = null;
      product = p;
      setErrorMessage(null);
    } else {
      setErrorMessage('Error has occured');
    }
    update();
  }
}
