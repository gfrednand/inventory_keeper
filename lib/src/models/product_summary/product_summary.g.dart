// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductSummary _$$_ProductSummaryFromJson(Map<String, dynamic> json) =>
    _$_ProductSummary(
      active: json['active'] as bool?,
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      currentStock: json['currentStock'] as int,
      amount: (json['amount'] as num?)?.toDouble(),
      summaryDate:
          const ServerTimestampConverter().fromJson(json['summaryDate']),
    );

Map<String, dynamic> _$$_ProductSummaryToJson(_$_ProductSummary instance) =>
    <String, dynamic>{
      'active': instance.active,
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'currentStock': instance.currentStock,
      'amount': instance.amount,
      'summaryDate':
          const ServerTimestampConverter().toJson(instance.summaryDate),
    };
