import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_keeper/src/models/partner/partner.dart';
import 'package:inventory_keeper/src/models/product_summary/product_summary.dart';

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

  ///
  all
}

///
@freezed
abstract class ProductTransaction with _$ProductTransaction {
  ///
  const factory ProductTransaction({
    required TransactionType transactionType,
    required double totalAmount,
    required int totalQuantity,
    required int totalAuditedQuantity,
    required int transactionDate,
    Partner? partner,
    required List<ProductSummary> productsSummary,
  }) = _ProductTransaction;

  ///
  factory ProductTransaction.fromJson(Map<String, dynamic> json) =>
      _$ProductTransactionFromJson(json);
}
