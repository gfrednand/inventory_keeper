// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamSettings _$$_TeamSettingsFromJson(Map<String, dynamic> json) =>
    _$_TeamSettings(
      id: json['id'] as String?,
      currency: json['currency'] as String?,
      teamId: json['teamId'] as String,
      isSoundOn: json['isSoundOn'] as bool? ?? true,
      appVersion: json['appVersion'] as String?,
    );

Map<String, dynamic> _$$_TeamSettingsToJson(_$_TeamSettings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': instance.currency,
      'teamId': instance.teamId,
      'isSoundOn': instance.isSoundOn,
      'appVersion': instance.appVersion,
    };
