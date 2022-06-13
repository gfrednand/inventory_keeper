// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductCategory _$$_ProductCategoryFromJson(Map<String, dynamic> json) =>
    _$_ProductCategory(
      id: json['id'] as String?,
      name: json['name'] as String,
      userId: json['userId'] as String,
      lastUpdatedAt: json['lastUpdatedAt'] as int,
    );

Map<String, dynamic> _$$_ProductCategoryToJson(_$_ProductCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'lastUpdatedAt': instance.lastUpdatedAt,
    };
