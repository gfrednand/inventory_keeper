// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductSummary _$$_ProductSummaryFromJson(Map<String, dynamic> json) =>
    _$_ProductSummary(
      id: json['id'] as String?,
      productId: json['productId'] as String,
      teamId: json['teamId'] as String,
      quantity: json['quantity'] as int? ?? 0,
      auditedQuantity: json['auditedQuantity'] as int? ?? 0,
      currentStock: json['currentStock'] as int? ?? 0,
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      lastUpdatedAt: json['lastUpdatedAt'] as int,
    );

Map<String, dynamic> _$$_ProductSummaryToJson(_$_ProductSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'teamId': instance.teamId,
      'quantity': instance.quantity,
      'auditedQuantity': instance.auditedQuantity,
      'currentStock': instance.currentStock,
      'amount': instance.amount,
      'lastUpdatedAt': instance.lastUpdatedAt,
    };
