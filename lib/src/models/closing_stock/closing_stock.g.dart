// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closing_stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClosingStock _$$_ClosingStockFromJson(Map<String, dynamic> json) =>
    _$_ClosingStock(
      date: DateTime.parse(json['date'] as String),
      products: (json['products'] as List<dynamic>)
          .map((dynamic e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ClosingStockToJson(_$_ClosingStock instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'products': instance.products,
    };
