// To parse this JSON data, do
//
//     final updatedAt = updatedAtFromMap(jsonString);

// ignore_for_file: public_member_api_docs
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'updated_at.freezed.dart';
part 'updated_at.g.dart';

@freezed
abstract class UpdatedAt with _$UpdatedAt {
  const factory UpdatedAt({
    @Default(0) int teamSettingsLastUpdate,
    @Default(0) int usersLastUpdate,
    @Default(0) int rolesLastUpdate,
    @Default(0) int permissionsLastUpdate,
    @Default(0) int productsLastUpdate,
    @Default(0) int stockSummariesLastUpdate,
    @Default(0) int productTransactionsLastUpdate,
    @Default(0) int partnersLastUpdate,
    @Default(0) int categoriesLastUpdate,
    @Default(0) int productsSummaryLastUpdate,
    @Default(0) int teamsLastUpdate,
  }) = _UpdatedAt;

  factory UpdatedAt.fromJson(Map<String, dynamic> json) =>
      _$UpdatedAtFromJson(json);
}
