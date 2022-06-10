// To parse this JSON data, do
//
//     final productType = productTypeFromMap(jsonString);
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_type.freezed.dart';
part 'product_type.g.dart';

///
@freezed
class ProductType with _$ProductType {
  ///
  const factory ProductType({
    String? id,
    required String name,
    required int lastUpdatedAt,
    required String userId,
  }) = _ProductType;

  ///
  factory ProductType.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeFromJson(json);
}
