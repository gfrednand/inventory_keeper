// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamSettings _$$_TeamSettingsFromJson(Map<String, dynamic> json) =>
    _$_TeamSettings(
      currency: json['currency'] as String?,
      isSoundOn: json['isSoundOn'] as bool? ?? true,
      appVersion: json['appVersion'] as String?,
    );

Map<String, dynamic> _$$_TeamSettingsToJson(_$_TeamSettings instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'isSoundOn': instance.isSoundOn,
      'appVersion': instance.appVersion,
    };
