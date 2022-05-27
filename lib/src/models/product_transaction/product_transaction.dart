import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_keeper/src/models/product_summary/product_summary.dart';

import 'package:inventory_keeper/src/models/server_timestamp_converter.dart';

part 'product_transaction.freezed.dart';
part 'product_transaction.g.dart';

///
enum TransactionType {
  /// incoimng stock
  inStock,

  /// outgoing stock
  outStock,

  /// changing stock
  audit,
}

///
@freezed
abstract class ProductTransaction with _$ProductTransaction {
  ///
  const factory ProductTransaction({
    required TransactionType transactionType,
    required double totalAmount,
    required int totalQuantity,
    required int totalSelectedQuantity,
    required int transactionDate,
    required List<ProductSummary> productsSummary,
  }) = _ProductTransaction;

  ///
  factory ProductTransaction.fromJson(Map<String, dynamic> json) =>
      _$ProductTransactionFromJson(json);
}
