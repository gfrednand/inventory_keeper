// To parse this JSON data, do
//
//     final team = teamFromMap(jsonString);

// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:inventory_keeper/src/models/product/product.dart';
// import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
// import 'package:inventory_keeper/src/models/stock_summary/stock_summay.dart';
// import 'package:inventory_keeper/src/models/team_settings/team_settings.dart';
// import 'package:flutter/foundation.dart';

// import 'package:inventory_keeper/src/models/updatedAt/updated_at.dart';
// import 'package:inventory_keeper/src/models/user/user.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
abstract class Team with _$Team {
  const factory Team({
    String? id,
    required String name,
    required int lastUpdatedAt,
    required String userId,
    // UpdatedAt? updatedAt,
    // TeamSettings? teamSettings,
    // List<Product>? products,
    // List<StockSummary> stockSummary,
    // List<ProductTransaction> productTransactions,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
