// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_keeper/src/models/product_category/product_category.dart';

part 'product.freezed.dart';
part 'product.g.dart';

///
@freezed
abstract class Product with _$Product {
  const factory Product({
    String? id,
    required String userId,
    required String name,
    String? image,
    bool? active,
    String? description,
    String? unit,
    @Default(0) double salePrice,
    @Default(0) double buyPrice,
    @Default(0) int currentStock,
    @Default(0) int safetyQuantity,
    ProductCategory? category,
    int? expireDate,
    required int lastUpdatedAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
