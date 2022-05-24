import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/stock/stock.dart';

/// Stock Controller
class StockController extends BaseController {
  final FireBaseRepository _api = FireBaseRepository('stocks');

  Stock? _stock;
  Transaction? _transaction;
  int? _currentStock;
  int? _incomingStock;
  int? _outgoingStock;
  DateTime? _updatedAt;
  DateTime? _createdAt;

  ///
  set stock(Stock? i) {
    _stock = i;
    update();
  }

  ///
  set transaction(Transaction? i) {
    _transaction = i;
    update();
  }

  ///
  set currentStock(int? i) {
    currentStock = i;
    update();
  }

  ///
  set incomingStock(int? i) {
    incomingStock = i;
    update();
  }

  ///
  set outgoingStock(int? i) {
    outgoingStock = i;
    update();
  }

  ///
  set updatedAt(DateTime? i) {
    updatedAt = i;
    update();
  }

  ///
  set createdAt(DateTime? i) {
    createdAt = i;
    update();
  }

  ///
  Stock? get stock => _stock;

  ///
  Transaction? get transaction => _transaction;

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
    update();
  }

  /// Future Items
  Future<List<Stock>> fetchItems() async {
    busy = true;
    final objs = await _api.allItems();
    busy = false;
    final ps = <Stock>[];
    for (final item in objs) {
      ps.add(Stock.fromJson(item));
    }
    _stocks = ps;
    return ps;
  }

  Future<Stock?> getStockByDate(String date) async {
    final obj = await _api.getClosingStockByDate(date);

    if (obj != null) {
      return Stock.fromJson(obj);
    }
    return null;
  }

  ///

  /// Add a product to a current Stocks state
  Future<List<Product>> addStock(
      {required bool isIncoming, required Transaction transaction}) async {
    final productSummary = products
        .map(
          (e) => {
            'active': e.active ?? true,
            'buyPrice': e.buyPrice ?? 0,
            'salePrice': e.salePrice ?? 0,
            'id': e.id ?? '',
            'name': e.name,
            'summaryDate': DateTime.now(),
            'currentStock': e.currentStock,
          },
        )
        .toList();

    final productsSummary = transaction.productsSummary
        .map(
          (e) => {
            'active': e.active,
            'amount': e.amount,
            'isIncoming': e.isIncoming,
            'id': e.id,
            'name': e.name,
            'summaryDate': e.summaryDate,
            'currentQuantity': e.currentQuantity,
          },
        )
        .toList();
    final stock = Stock(
      totalAmount: 0,
      totalQuantity: 8,
      createdAt: DateFormat.yMMMEd().format(DateTime.now()),
      productsSummary: [],
      transactions: [],
    );

    final transactionMap = {
      'isIncoming': transaction.isIncoming,
      'totalSelectedQuantity': 0,
      'createdAt': transaction.createdAt,
      'productsSummary': productsSummary,
      'totalQuantity': transaction.totalQuantity,
      'totalAmount': transaction.totalAmount,
    };

    final map = stock.toJson();
    map['productsSummary'] = productSummary;

    final success = await _api.createOrUpdate(
      map,
      transactionMap,
      stock.createdAt,
    );
    if (success) {
      // _navigationService.goBackUntil(ProductListView.routeName);
    }
    return [];
  }

  /// Remove product from a current Stocks state
  Future<bool> removeStock() async {
    final success = await _api.removeOne(stock!.toJson());
    if (success) {
      stock = null;
      // var count = 0;
      // _navigationService.goBackUntil((route) {
      //   return count++ == 2;
      // });
    }
    update();
    return success;
  }

  /// Fetching stream of data
  Stream<List<Stock>> fetchStocksAsStream() {
    return _api.streamDataCollection().map(
          (maps) => maps.map(Stock.fromJson).toList(),
        );
  }
}
