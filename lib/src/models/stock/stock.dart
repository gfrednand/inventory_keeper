// To parse this JSON data, do
//
//     final stock = stockFromMap(jsonString);

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_keeper/src/models/product_summary/product_summary.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';

part 'stock.freezed.dart';
part 'stock.g.dart';

///
@freezed
abstract class Stock with _$Stock {
  ///
  const factory Stock({
    required List<ProductSummary> productsSummary,
    required double totalAmount,
    required int totalQuantity,
    required int totalIn,
    required int totalOut,
    required double totalSale,
    required double totalBuy,
    required int lastUpdatedAt,
  }) = _Stock;

  ///
  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
}
