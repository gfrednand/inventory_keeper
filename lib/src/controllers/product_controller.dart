import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/homepage/layout_page.dart';
import 'package:inventory_keeper/src/locator.dart';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/models/product_type.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
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
  final NavigationService _navigationService = locator<NavigationService>();
  final FireBaseRepository _api = FireBaseRepository('products');
  List<Product> _productList = [];

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

  ///
  int? _safetyQuantity;

  ///
  int? get safetyQuantity => _safetyQuantity;

  ///
  set safetyQuantity(int? q) {
    _safetyQuantity = q;
    notifyListeners();
  }

  ///
  int? _currentStockQuantity;

  ///
  int? get currentStockQuantity => _currentStockQuantity;

  ///
  set currentStockQuantity(int? q) {
    _currentStockQuantity = q;
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
    var newProduct = generateProduct();
    busy = true;
    newProduct = newProduct.copyWith(createdAt: DateTime.now());

    final success = await _api.addOne(newProduct.toMap());
    if (success) {
      _navigationService.goBackUntil(LayoutPage.routeName);
      resetValues(success, null);
    }
  }

  ///
  Future<void> updateProducts(List<Product> prods) async {
    final prodMap = prods.where((p) => p.isIncomingStock != null).map((p) {
      p = p.copyWith(
        updatedAt: DateTime.now(),
      );
      return p.toMap();
    }).toList();
    final success = await _api.updateMany(prodMap);
    if (success) {
      _navigationService.goBackUntil(ProductDetails.routeName);
    }
  }

  /// Update a product to a current products state
  Future<Product?> updateProduct() async {
    var updateProduct = generateProduct();
    if (updateProduct != _product) {
      updateProduct = updateProduct.copyWith(
        id: product?.id,
        updatedAt: DateTime.now(),
      );

      final success = await _api.updateOne(updateProduct.toMap());
      if (success) {
        _navigationService.goBackUntil(ProductDetails.routeName);
        resetValues(success, updateProduct);
      }
      return updateProduct;
    }
    return null;
  }

  /// Remove product from a current products state
  Future<void> removeProduct() async {
    busy = true;
    final success = await _api.removeOne(product!.toMap());
    busy = false;
    if (success) _navigationService.goBackUntil(LayoutPage.routeName);
  }

  /// Fetching stream of data
  Stream<List<Product>> fetchProductsAsStream({String? query}) {
    return _api.streamDataCollection(query: query).map(
          (maps) => maps.map((item) {
            return Product.fromMap(item);
          }).toList(),
        );
  }

  ///
  Product generateProduct() {
    var newProduct = Product(
      name: nameController.text,
      unit: unitController.text,
      type: type,
      salePrice: double.tryParse(salePriceController.text) ?? 0,
      buyPrice: double.tryParse(buyPriceController.text) ?? 0,
    );

    if (currentStockQuantity != null) {
      newProduct = newProduct.copyWith(
        currentStock: currentStockQuantity,
      );
    }

    if (safetyQuantity != null) {
      newProduct = newProduct.copyWith(safetyStock: safetyQuantity);
    }

    return newProduct;
  }

  ///
  void resetValues(bool success, Product? p) {
    if (success) {
      nameController.text = '';
      unitController.text = '';
      salePriceController.text = '';
      type = null;
      safetyQuantity = null;
      currentStockQuantity = null;
      product = p;
      setErrorMessage(null);
    } else {
      setErrorMessage('Error has occured');
    }
    notifyListeners();
  }
}
