// // To parse this JSON data, do
// //
// //     final team = teamFromMap(jsonString);

// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'dart:convert';

// part 'team.freezed.dart';
// part 'team.g.dart';

// @freezed
// abstract class Team with _$Team {
//   const factory Team({
//     String id,
//     String name,
//     UpdatedAt updatedAt,
//     Settings settings,
//     List<User> users,
//     List<Product> products,
//     List<StockSummary> stockSummary,
//     List<ProductTransaction> productTransactions,
//   }) = _Team;

//   factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
// }

// @freezed
// abstract class ProductTransaction with _$ProductTransaction {
//   const factory ProductTransaction({
//     String id,
//     String userId,
//     bool isPastTransaction,
//     String transactionType,
//     double totalAmount,
//     int totalQuantity,
//     int totalAuditQuantity,
//     Partner partner,
//     List<ProductsSummary> productsSummary,
//     int lastUpdatedAt,
//   }) = _ProductTransaction;

//   factory ProductTransaction.fromJson(Map<String, dynamic> json) =>
//       _$ProductTransactionFromJson(json);
// }

// @freezed
// abstract class Partner with _$Partner {
//   const factory Partner({
//     String id,
//     String name,
//     String userId,
//     String type,
//     int lastUpdatedAt,
//     List<Permission> permissions,
//   }) = _Partner;

//   factory Partner.fromJson(Map<String, dynamic> json) =>
//       _$PartnerFromJson(json);
// }

// @freezed
// abstract class Permission with _$Permission {
//   const factory Permission({
//     String id,
//     String name,
//     bool active,
//   }) = _Permission;

//   factory Permission.fromJson(Map<String, dynamic> json) =>
//       _$PermissionFromJson(json);
// }

// @freezed
// abstract class ProductsSummary with _$ProductsSummary {
//   const factory ProductsSummary({
//     String productId,
//     int quantity,
//     int auditedQuantity,
//     int currentStock,
//   }) = _ProductsSummary;

//   factory ProductsSummary.fromJson(Map<String, dynamic> json) =>
//       _$ProductsSummaryFromJson(json);
// }

// @freezed
// abstract class Product with _$Product {
//   const factory Product({
//     String id,
//     String userId,
//     String name,
//     String image,
//     bool active,
//     String description,
//     String unit,
//     int salePrice,
//     int buyPrice,
//     int safetyStock,
//     Partner category,
//     int expireDate,
//     int lastUpdatedAt,
//   }) = _Product;

//   factory Product.fromJson(Map<String, dynamic> json) =>
//       _$ProductFromJson(json);
// }

// @freezed
// abstract class Settings with _$Settings {
//   const factory Settings({
//     String currency,
//     bool isSoundOn,
//     String appVersion,
//   }) = _Settings;

//   factory Settings.fromJson(Map<String, dynamic> json) =>
//       _$SettingsFromJson(json);
// }

// @freezed
// abstract class StockSummary with _$StockSummary {
//   const factory StockSummary({
//     String id,
//     double totalAmount,
//     int totalQuantity,
//     int totalIn,
//     int totalOut,
//     double totalSale,
//     double totalBuy,
//     int lastUpdatedAt,
//     List<ProductsSummary> productsSummary,
//   }) = _StockSummary;

//   factory StockSummary.fromJson(Map<String, dynamic> json) =>
//       _$StockSummaryFromJson(json);
// }

// @freezed
// abstract class UpdatedAt with _$UpdatedAt {
//   const factory UpdatedAt({
//     int settings,
//     int users,
//     int roles,
//     int permissions,
//     int products,
//     int stockSummary,
//     int productTransactions,
//     int partner,
//     int category,
//   }) = _UpdatedAt;

//   factory UpdatedAt.fromJson(Map<String, dynamic> json) =>
//       _$UpdatedAtFromJson(json);
// }

// @freezed
// abstract class User with _$User {
//   const factory User({
//     String id,
//     String fullname,
//     String phoneNumber,
//     String photoUrl,
//     int lastUpdatedAt,
//     List<Partner> roles,
//   }) = _User;

//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
// }
