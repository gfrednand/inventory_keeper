// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_keeper/src/models/partner/partner.dart';
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

  ///
  all
}

///
@freezed
abstract class ProductTransaction with _$ProductTransaction {
  const factory ProductTransaction({
    String? id,
    required String userId,
    @Default(false) bool isPastTransaction,
    required TransactionType transactionType,
    required double totalAmount,
    required int totalQuantity,
    @Default(0) int totalAuditQuantity,
    Partner? partner,
    required List<ProductSummary> productsSummary,
    required int lastUpdatedAt,
    int? transactionDate,
  }) = _ProductTransaction;

  factory ProductTransaction.fromJson(Map<String, dynamic> json) =>
      _$ProductTransactionFromJson(json);
}
