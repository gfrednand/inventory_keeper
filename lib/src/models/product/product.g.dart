// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      active: json['active'] as bool?,
      description: json['description'] as String?,
      unit: json['unit'] as String?,
      salePrice: (json['salePrice'] as num?)?.toDouble() ?? 0,
      buyPrice: (json['buyPrice'] as num?)?.toDouble() ?? 0,
      currentStock: json['currentStock'] as int? ?? 0,
      safetyQuantity: json['safetyQuantity'] as int? ?? 0,
      category: json['category'] == null
          ? null
          : ProductCategory.fromJson(json['category'] as Map<String, dynamic>),
      expireDate: json['expireDate'] as int?,
      lastUpdatedAt: json['lastUpdatedAt'] as int,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'image': instance.image,
      'active': instance.active,
      'description': instance.description,
      'unit': instance.unit,
      'salePrice': instance.salePrice,
      'buyPrice': instance.buyPrice,
      'currentStock': instance.currentStock,
      'safetyQuantity': instance.safetyQuantity,
      'category': instance.category,
      'expireDate': instance.expireDate,
      'lastUpdatedAt': instance.lastUpdatedAt,
    };
