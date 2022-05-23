// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_keeper/src/models/product_type/product_type.dart';

part 'product.freezed.dart';
part 'product.g.dart';

///
@freezed
class Product with _$Product {
  ///
  const factory Product({
    String? id,

    /// This is the name of the product.
    ///
    /// It's required must not be null.
    required String name,
    @Default(0) int currentStock,
    int? selectedQuantity,
    bool? active,
    String? description,
    String? unit,
    double? salePrice,
    double? buyPrice,
    @Default(0) int safetyStock,
    bool? isIncomingStock,
    ProductType? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? expireDate,
  }) = _Product;

  ///
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
