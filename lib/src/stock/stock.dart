import 'dart:convert';

import 'package:inventory_keeper/src/models/product.dart';

/// Stock Model
class Stock {
  /// Stock Constructor
  Stock({
    required this.id,
    required this.product,
    required this.currentStock,
    this.incomingStock,
    this.outgoingStock,
    required this.lastUpdatedAt,
  });

  /// Convert Map<String, dynamic> to Stock
  factory Stock.fromMap(Map<String, dynamic> map) => Stock(
        id: map['id'] as int,
        product: Product.fromMap(map['product'] as Map<String, dynamic>),
        currentStock: map['currentStock'] as int,
        incomingStock:
            map['incomingStock'] == null ? null : map['incomingStock'] as int,
        outgoingStock:
            map['outgoingStock'] == null ? null : map['outgoingStock'] as int,
        lastUpdatedAt: map['lastUpdatedAt'] as DateTime,
      );

  /// Convert Json String To Stock
  factory Stock.fromJson(String str) =>
      Stock.fromMap(json.decode(str) as Map<String, dynamic>);

  /// Convert To Map
  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'lastUpdatedAt': lastUpdatedAt,
        'currentStock': currentStock,
        'incomingStock': incomingStock,
        'outgoingStock': outgoingStock,
        'product': product.toMap(),
      };

  /// Convert to Json String
  String toJson() => json.encode(toMap());

  /// unique id of product stock
  int id;

  /// Product in a stock
  Product product;

  /// Current Stock of Product in a stock
  int currentStock;

  /// Incoming Stock of Product in a stock
  int? incomingStock;

  /// Outgoing Stock of Product in a stock
  int? outgoingStock;

  /// Last time stock is updated
  DateTime lastUpdatedAt;

  /// returns new Product with your desired properties.
  Stock copyWith({
    required int id,
    required DateTime lastUpdatedAt,
    required int currentStock,
    required Product product,
    int? incomingStock,
    int? outgoingStock,
  }) =>
      Stock(
        id: id,
        lastUpdatedAt: lastUpdatedAt,
        currentStock: currentStock,
        incomingStock: incomingStock,
        outgoingStock: outgoingStock,
        product: product,
      );
}
