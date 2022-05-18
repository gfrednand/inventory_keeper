// To parse this JSON data, do
//
//     final stock = stockFromMap(jsonString);

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_keeper/src/models/product/product.dart';

part 'stock.freezed.dart';
part 'stock.g.dart';

///
@freezed
class Stock with _$Stock {
  ///
  const factory Stock({
    required String createdAt,
    required int totalSelectedQuantity,
    String? id,
    required bool isIncoming,
    required double totalAmount,
    required List<Product> products,
  }) = _Stock;

  ///
  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
}
