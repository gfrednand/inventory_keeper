// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductTransaction _$$_ProductTransactionFromJson(
        Map<String, dynamic> json) =>
    _$_ProductTransaction(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      teamId: json['teamId'] as String,
      isPastTransaction: json['isPastTransaction'] as bool? ?? false,
      transactionType:
          $enumDecode(_$TransactionTypeEnumMap, json['transactionType']),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      totalQuantity: json['totalQuantity'] as int,
      totalAuditQuantity: json['totalAuditQuantity'] as int? ?? 0,
      partner: json['partner'] == null
          ? null
          : Partner.fromJson(json['partner'] as Map<String, dynamic>),
      productsSummary: (json['productsSummary'] as List<dynamic>)
          .map(
              (dynamic e) => ProductSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedAt: json['lastUpdatedAt'] as int,
      transactionDate: json['transactionDate'] as int?,
    );

Map<String, dynamic> _$$_ProductTransactionToJson(
        _$_ProductTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'teamId': instance.teamId,
      'isPastTransaction': instance.isPastTransaction,
      'transactionType': _$TransactionTypeEnumMap[instance.transactionType],
      'totalAmount': instance.totalAmount,
      'totalQuantity': instance.totalQuantity,
      'totalAuditQuantity': instance.totalAuditQuantity,
      'partner': instance.partner,
      'productsSummary': instance.productsSummary,
      'lastUpdatedAt': instance.lastUpdatedAt,
      'transactionDate': instance.transactionDate,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.inStock: 'inStock',
  TransactionType.outStock: 'outStock',
  TransactionType.audit: 'audit',
  TransactionType.all: 'all',
};
