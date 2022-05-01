import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/locator.dart';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/models/product_type.dart';
import 'package:inventory_keeper/src/services/navigation_service.dart';

/// Product Controller
class ProductController extends BaseController {
  final NavigationService _navigationService = locator<NavigationService>();
  final FireBaseRepository _api = FireBaseRepository('products');
  List<Product> _productList = [];

  ///
  TextEditingController nameController = TextEditingController(),
      priceController = TextEditingController(),
      unitController = TextEditingController();

  ///
  FocusNode unitFocusNode = FocusNode(),
      priceFocusNode = FocusNode(),
      nameFocusNode = FocusNode();

  Product? _product;

  /// Product
  Product? get product => _product;
  set product(Product? newproduct) {
    _product = newproduct;
    nameController.text = newproduct?.name ?? '';
    priceController.text = (newproduct?.pricePerUnit ?? '').toString();
    unitController.text = newproduct?.unit ?? '';
    type = newproduct?.type;
    notifyListeners();
  }

  ProductType? _type;

  /// Product categories
  ProductType? get type => _type;
  set type(ProductType? newType) {
    if (_type?.name == newType?.name) {
      _type = null;
    } else {
      _type = newType;
    }
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
  Future<void> addProduct() async {
    busy = true;
    var newProduct = generateProduct();
    busy = true;
    newProduct = newProduct.copyWith(createdAt: DateTime.now());
    final success = await _api.addOne(newProduct.toMap());
    busy = false;
    resetValues(success);
  }

  /// Update a product to a current products state
  Future<void> updateProduct() async {
    var updateProduct = generateProduct();
    busy = true;
    updateProduct =
        updateProduct.copyWith(id: product!.id, updatedAt: DateTime.now());
    print(updateProduct.toMap());
    final success = await _api.updateOne(updateProduct.toMap());
    busy = false;
    resetValues(success);
  }

  /// Remove product from a current products state
  Future<void> removeProduct() async {
    busy = true;
    final success = await _api.removeOne(product!.toMap());
    busy = false;
    resetValues(success);
  }

  /// Fetching stream of data
  Stream<List<Product>> fetchProductsAsStream() {
    return _api.streamDataCollection().map(
          (maps) => maps.map((item) {
            return Product.fromMap(item);
          }).toList(),
        );
  }

  ///
  Product generateProduct() {
    final newProduct = Product(
      name: nameController.text,
      unit: unitController.text,
      type: type,
      pricePerUnit: double.parse(priceController.text),
    );
    return newProduct;
  }

  ///
  void resetValues(bool success) {
    if (success) {
      nameController.text = '';
      unitController.text = '';
      priceController.text = '';
      type = null;
      product = null;
      _navigationService.goBack();
      setErrorMessage(null);
    } else {
      setErrorMessage('Error has occured');
    }
  }
}
