// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Role _$$_RoleFromJson(Map<String, dynamic> json) => _$_Role(
      id: json['id'] as String?,
      teamId: json['teamId'] as String,
      name: json['name'] as String,
      lastUpdatedAt: json['lastUpdatedAt'] as int,
      permissions: (json['permissions'] as List<dynamic>)
          .map((dynamic e) => Permission.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RoleToJson(_$_Role instance) => <String, dynamic>{
      'id': instance.id,
      'teamId': instance.teamId,
      'name': instance.name,
      'lastUpdatedAt': instance.lastUpdatedAt,
      'permissions': instance.permissions,
    };
