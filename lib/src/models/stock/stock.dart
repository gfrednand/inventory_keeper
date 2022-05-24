// To parse this JSON data, do
//
//     final stock = stockFromMap(jsonString);

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_keeper/src/models/server_timestamp_converter.dart';

part 'stock.freezed.dart';
part 'stock.g.dart';

///
@freezed
abstract class Stock with _$Stock {
  ///
  const factory Stock({
    required String createdAt,
    required List<ProductSummary> productsSummary,
    required double totalAmount,
    required int totalQuantity,
    required List<Transaction> transactions,
  }) = _Stock;

  ///
  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
}

///
@freezed
abstract class ProductSummary with _$ProductSummary {
  ///
  const factory ProductSummary({
    required bool active,
    required String id,
    required String name,
    required int currentQuantity,
    required int selectedQuantity,
    required double amount,
    required bool isIncoming,
    @ServerTimestampConverter() required DateTime summaryDate,
  }) = _ProductSummary;

  ///
  factory ProductSummary.fromJson(Map<String, dynamic> json) =>
      _$ProductSummaryFromJson(json);
}

///
@freezed
abstract class Transaction with _$Transaction {
  ///
  const factory Transaction({
    required bool isIncoming,
    required double totalAmount,
    required int totalQuantity,
    required int totalSelectedQuantity,
    @ServerTimestampConverter() required DateTime createdAt,
    required List<ProductSummary> productsSummary,
  }) = _Transaction;

  ///
  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
