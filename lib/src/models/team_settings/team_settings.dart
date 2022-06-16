// To parse this JSON data, do
//

// ignore_for_file: public_member_api_docs
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_settings.freezed.dart';
part 'team_settings.g.dart';

@freezed
abstract class TeamSettings with _$TeamSettings {
  const factory TeamSettings({
    String? id,
    String? currency,
    required String teamId,
    @Default(true) bool isSoundOn,
    String? appVersion,
  }) = _TeamSettings;

  factory TeamSettings.fromJson(Map<String, dynamic> json) =>
      _$TeamSettingsFromJson(json);
}
