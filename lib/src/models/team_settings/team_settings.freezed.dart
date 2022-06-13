// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'team_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeamSettings _$TeamSettingsFromJson(Map<String, dynamic> json) {
  return _TeamSettings.fromJson(json);
}

/// @nodoc
mixin _$TeamSettings {
  String? get currency => throw _privateConstructorUsedError;
  bool get isSoundOn => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamSettingsCopyWith<TeamSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamSettingsCopyWith<$Res> {
  factory $TeamSettingsCopyWith(
          TeamSettings value, $Res Function(TeamSettings) then) =
      _$TeamSettingsCopyWithImpl<$Res>;
  $Res call({String? currency, bool isSoundOn, String? appVersion});
}

/// @nodoc
class _$TeamSettingsCopyWithImpl<$Res> implements $TeamSettingsCopyWith<$Res> {
  _$TeamSettingsCopyWithImpl(this._value, this._then);

  final TeamSettings _value;
  // ignore: unused_field
  final $Res Function(TeamSettings) _then;

  @override
  $Res call({
    Object? currency = freezed,
    Object? isSoundOn = freezed,
    Object? appVersion = freezed,
  }) {
    return _then(_value.copyWith(
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      isSoundOn: isSoundOn == freezed
          ? _value.isSoundOn
          : isSoundOn // ignore: cast_nullable_to_non_nullable
              as bool,
      appVersion: appVersion == freezed
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TeamSettingsCopyWith<$Res>
    implements $TeamSettingsCopyWith<$Res> {
  factory _$$_TeamSettingsCopyWith(
          _$_TeamSettings value, $Res Function(_$_TeamSettings) then) =
      __$$_TeamSettingsCopyWithImpl<$Res>;
  @override
  $Res call({String? currency, bool isSoundOn, String? appVersion});
}

/// @nodoc
class __$$_TeamSettingsCopyWithImpl<$Res>
    extends _$TeamSettingsCopyWithImpl<$Res>
    implements _$$_TeamSettingsCopyWith<$Res> {
  __$$_TeamSettingsCopyWithImpl(
      _$_TeamSettings _value, $Res Function(_$_TeamSettings) _then)
      : super(_value, (v) => _then(v as _$_TeamSettings));

  @override
  _$_TeamSettings get _value => super._value as _$_TeamSettings;

  @override
  $Res call({
    Object? currency = freezed,
    Object? isSoundOn = freezed,
    Object? appVersion = freezed,
  }) {
    return _then(_$_TeamSettings(
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      isSoundOn: isSoundOn == freezed
          ? _value.isSoundOn
          : isSoundOn // ignore: cast_nullable_to_non_nullable
              as bool,
      appVersion: appVersion == freezed
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeamSettings with DiagnosticableTreeMixin implements _TeamSettings {
  const _$_TeamSettings(
      {this.currency, this.isSoundOn = true, this.appVersion});

  factory _$_TeamSettings.fromJson(Map<String, dynamic> json) =>
      _$$_TeamSettingsFromJson(json);

  @override
  final String? currency;
  @override
  @JsonKey()
  final bool isSoundOn;
  @override
  final String? appVersion;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamSettings(currency: $currency, isSoundOn: $isSoundOn, appVersion: $appVersion)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamSettings'))
      ..add(DiagnosticsProperty('currency', currency))
      ..add(DiagnosticsProperty('isSoundOn', isSoundOn))
      ..add(DiagnosticsProperty('appVersion', appVersion));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamSettings &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            const DeepCollectionEquality().equals(other.isSoundOn, isSoundOn) &&
            const DeepCollectionEquality()
                .equals(other.appVersion, appVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currency),
      const DeepCollectionEquality().hash(isSoundOn),
      const DeepCollectionEquality().hash(appVersion));

  @JsonKey(ignore: true)
  @override
  _$$_TeamSettingsCopyWith<_$_TeamSettings> get copyWith =>
      __$$_TeamSettingsCopyWithImpl<_$_TeamSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamSettingsToJson(this);
  }
}

abstract class _TeamSettings implements TeamSettings {
  const factory _TeamSettings(
      {final String? currency,
      final bool isSoundOn,
      final String? appVersion}) = _$_TeamSettings;

  factory _TeamSettings.fromJson(Map<String, dynamic> json) =
      _$_TeamSettings.fromJson;

  @override
  String? get currency => throw _privateConstructorUsedError;
  @override
  bool get isSoundOn => throw _privateConstructorUsedError;
  @override
  String? get appVersion => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TeamSettingsCopyWith<_$_TeamSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
