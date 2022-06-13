// To parse this JSON data, do
//
//     final productType = productTypeFromMap(jsonString);
// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category.freezed.dart';
part 'product_category.g.dart';

///
@freezed
abstract class ProductCategory with _$ProductCategory {
  const factory ProductCategory({
    String? id,
    required String name,
    required String userId,
    required int lastUpdatedAt,
  }) = _ProductCategory;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
}
