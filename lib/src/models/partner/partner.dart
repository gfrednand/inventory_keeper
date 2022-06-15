// To parse this JSON data, do
//
//     final productType = productTypeFromMap(jsonString);
// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner.freezed.dart';
part 'partner.g.dart';

///
enum PartnerType {
  /// Vendor/ Customer
  vendor,

  /// supplier
  supplier,
}

///
@freezed
abstract class Partner with _$Partner {
  const factory Partner({
    String? id,
    required String name,
    required String userId,
    required String teamId,
    required PartnerType type,
    required int lastUpdatedAt,
  }) = _Partner;

  factory Partner.fromJson(Map<String, dynamic> json) =>
      _$PartnerFromJson(json);
}
