// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stock _$$_StockFromJson(Map<String, dynamic> json) => _$_Stock(
      createdAt: json['createdAt'] as String,
      productsSummary: (json['productsSummary'] as List<dynamic>)
          .map(
              (dynamic e) => ProductSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      totalQuantity: json['totalQuantity'] as int,
      transactions: (json['transactions'] as List<dynamic>)
          .map((dynamic e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StockToJson(_$_Stock instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'productsSummary': instance.productsSummary,
      'totalAmount': instance.totalAmount,
      'totalQuantity': instance.totalQuantity,
      'transactions': instance.transactions,
    };

_$_ProductSummary _$$_ProductSummaryFromJson(Map<String, dynamic> json) =>
    _$_ProductSummary(
      active: json['active'] as bool,
      id: json['id'] as String,
      name: json['name'] as String,
      currentStock: json['currentStock'] as int,
      buyPrice: (json['buyPrice'] as num).toDouble(),
      salePrice: (json['salePrice'] as num).toDouble(),
      summaryDate: DateTime.parse(json['summaryDate'] as String),
    );

Map<String, dynamic> _$$_ProductSummaryToJson(_$_ProductSummary instance) =>
    <String, dynamic>{
      'active': instance.active,
      'id': instance.id,
      'name': instance.name,
      'currentStock': instance.currentStock,
      'buyPrice': instance.buyPrice,
      'salePrice': instance.salePrice,
      'summaryDate': instance.summaryDate.toIso8601String(),
    };

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      isIncoming: json['isIncoming'] as bool,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      totalQuantity: json['totalQuantity'] as int,
      totalSelectedQuantity: json['totalSelectedQuantity'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      productsSummary: (json['productsSummary'] as List<dynamic>)
          .map(
              (dynamic e) => ProductSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'isIncoming': instance.isIncoming,
      'totalAmount': instance.totalAmount,
      'totalQuantity': instance.totalQuantity,
      'totalSelectedQuantity': instance.totalSelectedQuantity,
      'createdAt': instance.createdAt.toIso8601String(),
      'productsSummary': instance.productsSummary,
    };
