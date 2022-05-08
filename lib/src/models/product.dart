// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:inventory_keeper/src/models/product_type.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

/// Product Model
class Product {
  /// Product Constructor
  Product({
    this.id,
    this.description,
    required this.name,
    required this.unit,
    this.salePrice = 0.0,
    this.buyPrice = 0.0,
    this.safetyStock = 0,
    this.currentStock = 0,
    this.isIncomingStock,
    this.selectedQuantity,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.expireDate,
  });

  /// Convert Json String to Product
  factory Product.fromJson(String str) =>
      Product.fromMap(json.decode(str) as Map<String, dynamic>);

  /// Convert Map<String, dynamic> to Product
  factory Product.fromMap(Map<String, dynamic> json) {
    try {
      final p = Product(
        id: json['id'] == null ? null : json['id'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        createdAt:
            json['createdAt'] == null ? null : parseTime(json['createdAt']),
        updatedAt:
            json['updatedAt'] == null ? null : parseTime(json['updatedAt']),
        expireDate:
            json['expireDate'] == null ? null : parseTime(json['expireDate']),
        name: json['name'] as String,
        unit: json['unit'] as String,
        salePrice: (json['salePrice'] as num).toDouble(),
        buyPrice: (json['buyPrice'] as num).toDouble(),
        safetyStock: (json['safetyStock'] as num).toInt(),
        currentStock: (json['currentStock'] as num).toInt(),
        type: json['type'] == null
            ? null
            : ProductType.fromMap(json['type'] as Map<String, dynamic>),
      );

      return p;
    } catch (e) {
      debugPrint('Errorrrr $e');
    }
    return Product(name: 'Err', unit: 'Err');
  }

  /// Convert To Map
  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'description': description,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'expireDate': expireDate,
        'name': name,
        'unit': unit,
        'salePrice': salePrice,
        'buyPrice': buyPrice,
        'currentStock': currentStock,
        'safetyStock': safetyStock,
        'type': type?.toMap(),
      };

  /// Convert To Map
  Map<String, dynamic> toStockMap() =>
      <String, dynamic>{'id': id, 'name': name};

  /// Unique id of the product
  String? id;

  ///A detailed product description (Optional)
  String? description;

  /// A product’s name
  String name;

  /// The basic unit used to measure a product, e.g. pieces, kilograms, pounds
  String unit;

  /// The  Selling price per basic unit
  double salePrice;

  /// Buying Price per basic unit
  double buyPrice;

  /// Date time product created
  DateTime? createdAt;

  /// Date time product updated
  DateTime? updatedAt;

  /// Date time product updated
  DateTime? expireDate;

  /// Type or Category of a product
  ProductType? type;

  ///A current stock qunatity
  int currentStock;

  ///A current selected stock qunatity
  int? selectedQuantity;

  /// Is the selected quantity incoming
  bool? isIncomingStock;

  ///A safety stock qunatity(For notifications)
  int safetyStock;

  /// returns new Product with your desired properties.
  Product copyWith({
    String? id,
    String? description,
    String? name,
    String? unit,
    double? salePrice,
    double? buyPrice,
    int? currentStock,
    int? selectedQuantity,
    bool? isIncomingStock,
    int? safetyStock,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? expireDate,
    ProductType? type,
  }) =>
      Product(
        id: id ?? this.id,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        expireDate: expireDate ?? this.expireDate,
        name: name ?? this.name,
        unit: unit ?? this.unit,
        salePrice: salePrice ?? this.salePrice,
        currentStock: currentStock ?? this.currentStock,
        selectedQuantity: selectedQuantity ?? this.selectedQuantity,
        isIncomingStock: isIncomingStock ?? this.isIncomingStock,
        safetyStock: safetyStock ?? this.safetyStock,
        buyPrice: buyPrice ?? this.buyPrice,
        type: type ?? this.type,
      );

  /// Convert to Json String
  String toJson() => json.encode(toMap());
}
