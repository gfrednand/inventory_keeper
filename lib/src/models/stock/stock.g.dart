// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stock _$$_StockFromJson(Map<String, dynamic> json) => _$_Stock(
      productsSummary: (json['productsSummary'] as List<dynamic>)
          .map(
              (dynamic e) => ProductSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      totalQuantity: json['totalQuantity'] as int,
      totalIn: json['totalIn'] as int,
      totalOut: json['totalOut'] as int,
      totalSale: (json['totalSale'] as num).toDouble(),
      totalBuy: (json['totalBuy'] as num).toDouble(),
      lastUpdatedAt: json['lastUpdatedAt'] as int,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$_StockToJson(_$_Stock instance) => <String, dynamic>{
      'productsSummary': instance.productsSummary,
      'totalAmount': instance.totalAmount,
      'totalQuantity': instance.totalQuantity,
      'totalIn': instance.totalIn,
      'totalOut': instance.totalOut,
      'totalSale': instance.totalSale,
      'totalBuy': instance.totalBuy,
      'lastUpdatedAt': instance.lastUpdatedAt,
      'userId': instance.userId,
    };
