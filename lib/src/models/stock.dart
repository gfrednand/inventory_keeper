import 'dart:convert';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

/// Stock Model
class Stock {
  /// Stock Constructor
  Stock({
    required this.createdAt,
    required this.totalSelectedQuantity,
    required this.totalAmount,
    this.id,
    required this.isIncoming,
    this.updatedAt,
    required this.products,
  });

  /// Convert Map<String, dynamic> to Stock
  factory Stock.fromMap(Map<String, dynamic> map) => Stock(
        totalSelectedQuantity: map['totalSelectedQuantity'] as int,
        totalAmount: map['totalAmount'] as double,
        id: map['id'] as String,
        isIncoming: map['isIncoming'] as bool,
        createdAt: parseTime(map['createdAt'])!,
        updatedAt:
            map['updatedAt'] == null ? null : parseTime(map['updatedAt']),
        products: List<Product>.from(
          (map['products'] as List<dynamic>).map(Product.fromMap).toList(),
        ),
      );

  ///
  factory Stock.fromJson(String str) =>
      Stock.fromMap(json.decode(str) as Map<String, dynamic>);

  ///
  String toJson() => json.encode(toMap());

  ///
  int totalSelectedQuantity;

  ///
  double totalAmount;

  ///
  String? id;

  ///
  bool isIncoming;

  ///
  /// Last time stock is updated
  DateTime? updatedAt;

  ///  time stock is created
  DateTime createdAt;

  ///
  List<Product> products;

  ///
  Stock copyWith({
    DateTime? createdAt,
    int? totalSelectedQuantity,
    double? totalAmount,
    String? id,
    bool? isIncoming,
    DateTime? updatedAt,
    List<Product>? products,
  }) =>
      Stock(
        createdAt: createdAt ?? this.createdAt,
        totalSelectedQuantity:
            totalSelectedQuantity ?? this.totalSelectedQuantity,
        totalAmount: totalAmount ?? this.totalAmount,
        id: id ?? this.id,
        isIncoming: isIncoming ?? this.isIncoming,
        updatedAt: updatedAt ?? this.updatedAt,
        products: products ?? this.products,
      );

  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        'createdAt': createdAt,
        'totalSelectedQuantity': totalSelectedQuantity,
        'totalAmount': totalAmount,
        'id': id,
        'isIncoming': isIncoming,
        'updatedAt': updatedAt,
        'products': List<dynamic>.from(
          products.map<Map<String, dynamic>>(
            (x) => x.toMap(),
          ),
        ),
      };
}
