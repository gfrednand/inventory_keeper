import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/models/stock.dart';

/// Stock Controller
class StockController extends BaseController {
  final FireBaseRepository _api = FireBaseRepository('stocks');

  Product? _product;
  int? _currentStock;
  int? _incomingStock;
  int? _outgoingStock;
  DateTime? _updatedAt;
  DateTime? _createdAt;

  ///
  set product(Product? i) {
    _product = i;
    notifyListeners();
  }

  ///
  set currentStock(int? i) {
    currentStock = i;
    notifyListeners();
  }

  ///
  set incomingStock(int? i) {
    incomingStock = i;
    notifyListeners();
  }

  ///
  set outgoingStock(int? i) {
    outgoingStock = i;
    notifyListeners();
  }

  ///
  set updatedAt(DateTime? i) {
    updatedAt = i;
    notifyListeners();
  }

  ///
  set createdAt(DateTime? i) {
    createdAt = i;
    notifyListeners();
  }

  ///
  Product? get product => _product;

  ///
  int? get currentStock => _currentStock;

  ///
  int? get incomingStock => _incomingStock;

  ///
  int? get outgoingStock => _outgoingStock;

  ///
  DateTime? get updatedAt => _updatedAt;

  ///
  DateTime? get createdAt => _createdAt;

  ///
  TextEditingController nameController = TextEditingController();

  ///
  FocusNode nameFocusNode = FocusNode();

  List<Stock> _stocks = [];

  /// Get Stocks from current Stocks state
  List<Stock> get stocks {
    return [..._stocks];
  }

  set stocks(List<Stock> item) {
    _stocks = item;
    notifyListeners();
  }

  /// Future Items
  Future<List<Stock>> fetchItems() async {
    busy = true;
    final objs = await _api.allItems();
    busy = false;
    final ps = <Stock>[];
    for (final item in objs) {
      ps.add(Stock.fromMap(item));
    }
    _stocks = ps;
    return ps;
  }

  /// Add a product to a current Stocks state
  Future<List<Product>> addStock(bool isIncoming) async {
    final tempProds = products.where((p) => p.isIncomingStock != null).toList();
    final stock = Stock(
      createdAt: DateTime.now(),
      totalSelectedQuantity: totalQuantity,
      isIncoming: isIncoming,
      products: products,
    );

    final success = await _api.addOne(stock.toMap());
    if (success) {
      // _navigationService.goBackUntil(ProductListView.routeName);
      removeAllFromCart();
      return tempProds;
    }
    return [];
  }

  /// Update a product to a current Stocks state
  Future<void> updateStock(Stock item) async {
    busy = true;
    final success = await _api.updateOne(item.toMap());
    busy = false;
    if (success) _stocks.add(item);
    notifyListeners();
  }

  /// Remove product from a current Stocks state
  Future<void> removeStock(Stock item) async {
    busy = true;
    final success = await _api.removeOne(item.toMap());
    busy = false;
    if (success) {
      // final index = _stocks.indexWhere((p) => p.id == item.id);
      // _stocks.removeAt(index);
    }
    notifyListeners();
  }

  /// Fetching stream of data
  Stream<List<Stock>> fetchStocksAsStream() {
    return _api.streamDataCollection().map(
          (maps) => maps.map(Stock.fromMap).toList(),
        );
  }

  ///
  List<Product> products = [];

  ///
  double get totalPrice {
    return products.fold(0, (double currentTotal, Product nextProduct) {
      var price = 0.0;
      if (nextProduct.isIncomingStock != null && nextProduct.isIncomingStock!) {
        price = nextProduct.buyPrice;
      } else {
        price = nextProduct.salePrice;
      }
      return currentTotal + price * (nextProduct.selectedQuantity ?? 0);
    });
  }

  ///
  int get totalQuantity {
    return products.fold(0, (int currentQuantity, Product nextProduct) {
      return currentQuantity + nextProduct.selectedQuantity!;
    });
  }

  ///
  void updateCart(Product product) {
    products = products.map((p) {
      return product.copyWith(selectedQuantity: p.selectedQuantity);
    }).toList();
  }

  ///
  void addToCart(Product? product) {
    if (product != null) {
      final index = products.indexWhere((p) => p.id == product.id);
      if (index == -1) {
        products.add(product);
      } else {
        products[index].selectedQuantity = product.selectedQuantity;
      }
      notifyListeners();
    }
  }

  ///
  // void addManyToCart(List<Product> ps) => products = ps;

  ///
  void removeFromCart(Product product) {
    products.remove(product);
    notifyListeners();
  }

  ///
  void removeAllFromCart() {
    products = [];
    notifyListeners();
  }
}
