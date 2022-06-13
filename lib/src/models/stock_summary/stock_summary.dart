// To parse this JSON data, do
//

// ignore_for_file: public_member_api_docs
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:inventory_keeper/src/models/product_summary/product_summary.dart';

part 'stock_summary.freezed.dart';
part 'stock_summary.g.dart';

@freezed
abstract class StockSummary with _$StockSummary {
  const factory StockSummary({
    String? id,
    required double totalAmount,
    required int totalQuantity,
    required int totalIn,
    required int totalOut,
    required double totalSale,
    required double totalBuy,
    required int lastUpdatedAt,
    required List<ProductSummary> productsSummary,
  }) = _StockSummary;

  factory StockSummary.fromJson(Map<String, dynamic> json) =>
      _$StockSummaryFromJson(json);
}
