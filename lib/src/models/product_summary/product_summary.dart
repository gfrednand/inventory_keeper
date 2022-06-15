// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_summary.freezed.dart';
part 'product_summary.g.dart';

///
@freezed
abstract class ProductSummary with _$ProductSummary {
  const factory ProductSummary({
    String? id,
    required String productId,
    required String teamId,
    @Default(0) int quantity,
    @Default(0) int auditedQuantity,
    @Default(0) int currentStock,
    @Default(0) double amount,
    required int lastUpdatedAt,
  }) = _ProductSummary;

  factory ProductSummary.fromJson(Map<String, dynamic> json) =>
      _$ProductSummaryFromJson(json);
}
