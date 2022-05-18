// To parse this JSON data, do
//
//     final closingStock = closingStockFromMap(jsonString);
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_keeper/src/models/product/product.dart';

part 'closing_stock.freezed.dart';
part 'closing_stock.g.dart';

///
@freezed
abstract class ClosingStock with _$ClosingStock {
  ///
  const factory ClosingStock({
    required DateTime date,
    required List<Product> products,
  }) = _ClosingStock;

  ///
  factory ClosingStock.fromJson(Map<String, dynamic> json) =>
      _$ClosingStockFromJson(json);
}
