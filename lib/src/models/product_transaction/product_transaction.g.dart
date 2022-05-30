// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductTransaction _$$_ProductTransactionFromJson(
        Map<String, dynamic> json) =>
    _$_ProductTransaction(
      transactionType:
          $enumDecode(_$TransactionTypeEnumMap, json['transactionType']),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      totalQuantity: json['totalQuantity'] as int,
      totalAuditedQuantity: json['totalAuditedQuantity'] as int,
      transactionDate: json['transactionDate'] as int,
      partner: json['partner'] == null
          ? null
          : Partner.fromJson(json['partner'] as Map<String, dynamic>),
      productsSummary: (json['productsSummary'] as List<dynamic>)
          .map(
              (dynamic e) => ProductSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProductTransactionToJson(
        _$_ProductTransaction instance) =>
    <String, dynamic>{
      'transactionType': _$TransactionTypeEnumMap[instance.transactionType],
      'totalAmount': instance.totalAmount,
      'totalQuantity': instance.totalQuantity,
      'totalAuditedQuantity': instance.totalAuditedQuantity,
      'transactionDate': instance.transactionDate,
      'partner': instance.partner,
      'productsSummary': instance.productsSummary,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.inStock: 'inStock',
  TransactionType.outStock: 'outStock',
  TransactionType.audit: 'audit',
  TransactionType.all: 'all',
};
