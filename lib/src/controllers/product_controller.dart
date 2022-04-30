import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/models/product_type.dart';

/// Product Controller
class ProductController extends BaseController {
  final FireBaseRepository _api = FireBaseRepository('products');
  List<Product> _productList = [];

  ProductType _type = ProductType(id: 'as', name: 'Soft Drinks');
  List<ProductType> _types = [];

  ///
  TextEditingController nameController = TextEditingController(),
      priceController = TextEditingController(),
      unitController = TextEditingController();

  ///
  FocusNode unitFocusNode = FocusNode(),
      priceFocusNode = FocusNode(),
      nameFocusNode = FocusNode();

  /// Product categories
  ProductType get type => _type;
  set type(ProductType newType) {
    _type = newType;
    notifyListeners();
  }

  /// Get products from current products state
  List<ProductType> get types {
    return [..._types];
  }

  set types(List<ProductType> newTypes) {
    _types = newTypes;
    notifyListeners();
  }

  /// Get products from current products state
  List<Product> get products {
    return [..._productList];
  }

  /// Future Products
  Future<void> fetchProducts() async {
    busy = true;
    final objs = await _api.allItems();
    busy = false;
    final ps = <Product>[];
    for (final item in objs) {
      ps.add(Product.fromMap(item));
    }
    products = ps;
  }

  set products(List<Product> newProducts) {
    _productList = newProducts;
    notifyListeners();
  }

  /// Add a product to a current products state
  Future<void> addProduct(Product newProduct) async {
    busy = true;
    final success = await _api.addOne(newProduct.toMap());
    busy = false;
    if (success) _productList.add(newProduct);
    notifyListeners();
  }

  /// Update a product to a current products state
  Future<void> updateProduct(Product updateProduct) async {
    busy = true;
    final success = await _api.updateOne(updateProduct.toMap());
    busy = false;
    if (success) _productList.add(updateProduct);
    notifyListeners();
  }

  /// Remove product from a current products state
  Future<void> removeProduct(Product product) async {
    busy = true;
    final success = await _api.removeOne(product.toMap());
    busy = false;
    if (success) {
      final index = _productList.indexWhere((p) => p.id == product.id);
      _productList.removeAt(index);
    }
    notifyListeners();
  }

  /// Fetching stream of data
  Stream<List<Product>> fetchProductsAsStream() {
    return _api.streamDataCollection().map(
          (maps) => maps.map(Product.fromMap).toList(),
        );
  }
}
