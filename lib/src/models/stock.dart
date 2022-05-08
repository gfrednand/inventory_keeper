import 'dart:convert';

import 'package:inventory_keeper/src/utility/helpers.dart';

/// Stock Model
class Stock {
  /// Stock Constructor
  Stock({
    this.id,
    required this.productId,
    required this.currentStock,
    this.incomingStock,
    this.outgoingStock,
    this.updatedAt,
    this.createdAt,
  });

  /// Convert Map<String, dynamic> to Stock
  factory Stock.fromMap(Map<String, dynamic> map) => Stock(
        id: map['id'] as String,
        productId: map['productId'] as String,
        currentStock: map['currentStock'] as int,
        incomingStock:
            map['incomingStock'] == null ? null : map['incomingStock'] as int,
        outgoingStock:
            map['outgoingStock'] == null ? null : map['outgoingStock'] as int,
        createdAt:
            map['createdAt'] == null ? null : parseTime(map['createdAt']),
        updatedAt:
            map['updatedAt'] == null ? null : parseTime(map['updatedAt']),
      );

  /// Convert Json String To Stock
  factory Stock.fromJson(String str) =>
      Stock.fromMap(json.decode(str) as Map<String, dynamic>);

  /// Convert To Map
  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'updatedAt': updatedAt,
        'createdAt': createdAt,
        'currentStock': currentStock,
        'incomingStock': incomingStock,
        'outgoingStock': outgoingStock,
        'productId': productId,
      };

  /// Convert to Json String
  String toJson() => json.encode(toMap());

  /// unique id of product stock
  String? id;

  /// Product in a stock
  String productId;

  /// Current Stock of Product in a stock
  int currentStock;

  /// Incoming Stock of Product in a stock
  int? incomingStock;

  /// Outgoing Stock of Product in a stock
  int? outgoingStock;

  /// Last time stock is updated
  DateTime? updatedAt;

  ///  time stock is created
  DateTime? createdAt;

  /// returns new Product with your desired properties.
  Stock copyWith({
    String? id,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? currentStock,
    String? productId,
    int? incomingStock,
    int? outgoingStock,
  }) =>
      Stock(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        currentStock: currentStock ?? this.currentStock,
        incomingStock: incomingStock ?? this.incomingStock,
        outgoingStock: outgoingStock ?? this.outgoingStock,
        productId: productId ?? this.productId,
      );
}
