// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StockSummary _$$_StockSummaryFromJson(Map<String, dynamic> json) =>
    _$_StockSummary(
      id: json['id'] as String?,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      totalQuantity: json['totalQuantity'] as int,
      totalIn: json['totalIn'] as int,
      totalOut: json['totalOut'] as int,
      totalSale: (json['totalSale'] as num).toDouble(),
      totalBuy: (json['totalBuy'] as num).toDouble(),
      lastUpdatedAt: json['lastUpdatedAt'] as int,
      productsSummary: (json['productsSummary'] as List<dynamic>)
          .map(
              (dynamic e) => ProductSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StockSummaryToJson(_$_StockSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalAmount': instance.totalAmount,
      'totalQuantity': instance.totalQuantity,
      'totalIn': instance.totalIn,
      'totalOut': instance.totalOut,
      'totalSale': instance.totalSale,
      'totalBuy': instance.totalBuy,
      'lastUpdatedAt': instance.lastUpdatedAt,
      'productsSummary': instance.productsSummary,
    };
