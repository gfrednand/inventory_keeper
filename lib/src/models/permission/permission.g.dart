// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Permission _$$_PermissionFromJson(Map<String, dynamic> json) =>
    _$_Permission(
      id: json['id'] as String?,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$_PermissionToJson(_$_Permission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
    };
