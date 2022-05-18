// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stock _$$_StockFromJson(Map<String, dynamic> json) => _$_Stock(
      createdAt: json['createdAt'] as String,
      totalSelectedQuantity: json['totalSelectedQuantity'] as int,
      id: json['id'] as String?,
      isIncoming: json['isIncoming'] as bool,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      products: (json['products'] as List<dynamic>)
          .map((dynamic e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StockToJson(_$_Stock instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'totalSelectedQuantity': instance.totalSelectedQuantity,
      'id': instance.id,
      'isIncoming': instance.isIncoming,
      'totalAmount': instance.totalAmount,
      'products': instance.products,
    };
