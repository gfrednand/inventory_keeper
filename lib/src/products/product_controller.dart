import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/products/product.dart';

/// Product Controller
class ProductController with ChangeNotifier {
  final FireBaseRepository _api = FireBaseRepository('products');
  List<Product> _productList = [];

  /// Get products from current products state
  List<Product> get products {
    return [..._productList];
  }

  /// Future Products
  Future<void> fetchProducts() async {
    products = await _api.allItems();
  }

  set products(List<Product> newProducts) {
    _productList = newProducts;
    notifyListeners();
  }

  /// Add a product to a current products state
  Future<void> addProduct(Product newProduct) async {
    final success = await _api.addOne(newProduct);
    if (success) _productList.add(newProduct);
    notifyListeners();
  }

  /// Update a product to a current products state
  Future<void> updateProduct(Product updateProduct) async {
    final success = await _api.updateOne(updateProduct);
    if (success) _productList.add(updateProduct);
    notifyListeners();
  }

  /// Remove product from a current products state
  Future<void> removeProduct(Product product) async {
    final success = await _api.removeOne(product);
    if (success) {
      final index = _productList.indexWhere((p) => p.id == product.id);
      _productList.removeAt(index);
    }
    notifyListeners();
  }

  /// Fetching stream of data
  Stream<List<Product>> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }
}
