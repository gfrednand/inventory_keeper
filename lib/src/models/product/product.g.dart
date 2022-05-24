// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as String?,
      name: json['name'] as String,
      currentStock: json['currentStock'] as int? ?? 0,
      selectedQuantity: json['selectedQuantity'] as int?,
      active: json['active'] as bool?,
      description: json['description'] as String?,
      unit: json['unit'] as String?,
      salePrice: (json['salePrice'] as num?)?.toDouble(),
      buyPrice: (json['buyPrice'] as num?)?.toDouble(),
      safetyStock: json['safetyStock'] as int? ?? 0,
      isIncomingStock: json['isIncomingStock'] as bool?,
      type: json['type'] == null
          ? null
          : ProductType.fromJson(json['type'] as Map<String, dynamic>),
      createdAt: const ServerTimestampConverter().fromJson(json['createdAt']),
      updatedAt: const ServerTimestampConverter().fromJson(json['updatedAt']),
      expireDate: const ServerTimestampConverter().fromJson(json['expireDate']),
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currentStock': instance.currentStock,
      'selectedQuantity': instance.selectedQuantity,
      'active': instance.active,
      'description': instance.description,
      'unit': instance.unit,
      'salePrice': instance.salePrice,
      'buyPrice': instance.buyPrice,
      'safetyStock': instance.safetyStock,
      'isIncomingStock': instance.isIncomingStock,
      'type': instance.type,
      'createdAt': const ServerTimestampConverter().toJson(instance.createdAt),
      'updatedAt': const ServerTimestampConverter().toJson(instance.updatedAt),
      'expireDate':
          const ServerTimestampConverter().toJson(instance.expireDate),
    };
