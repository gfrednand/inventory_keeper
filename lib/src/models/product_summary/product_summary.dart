import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:inventory_keeper/src/models/server_timestamp_converter.dart';

part 'product_summary.freezed.dart';
part 'product_summary.g.dart';

///
@freezed
abstract class ProductSummary with _$ProductSummary {
  ///
  const factory ProductSummary({
    bool? active,
    required String id,
    required String name,
    required int quantity,
    required int auditedQuantity,
    required int currentStock,
    double? amount,
    required int lastUpdatedAt,
    @ServerTimestampConverter() DateTime? summaryDate,
  }) = _ProductSummary;

  ///
  factory ProductSummary.fromJson(Map<String, dynamic> json) =>
      _$ProductSummaryFromJson(json);
}
