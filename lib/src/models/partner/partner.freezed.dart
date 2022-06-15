// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'partner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Partner _$PartnerFromJson(Map<String, dynamic> json) {
  return _Partner.fromJson(json);
}

/// @nodoc
mixin _$Partner {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get teamId => throw _privateConstructorUsedError;
  PartnerType get type => throw _privateConstructorUsedError;
  int get lastUpdatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartnerCopyWith<Partner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerCopyWith<$Res> {
  factory $PartnerCopyWith(Partner value, $Res Function(Partner) then) =
      _$PartnerCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      String userId,
      String teamId,
      PartnerType type,
      int lastUpdatedAt});
}

/// @nodoc
class _$PartnerCopyWithImpl<$Res> implements $PartnerCopyWith<$Res> {
  _$PartnerCopyWithImpl(this._value, this._then);

  final Partner _value;
  // ignore: unused_field
  final $Res Function(Partner) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? teamId = freezed,
    Object? type = freezed,
    Object? lastUpdatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PartnerType,
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PartnerCopyWith<$Res> implements $PartnerCopyWith<$Res> {
  factory _$$_PartnerCopyWith(
          _$_Partner value, $Res Function(_$_Partner) then) =
      __$$_PartnerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      String userId,
      String teamId,
      PartnerType type,
      int lastUpdatedAt});
}

/// @nodoc
class __$$_PartnerCopyWithImpl<$Res> extends _$PartnerCopyWithImpl<$Res>
    implements _$$_PartnerCopyWith<$Res> {
  __$$_PartnerCopyWithImpl(_$_Partner _value, $Res Function(_$_Partner) _then)
      : super(_value, (v) => _then(v as _$_Partner));

  @override
  _$_Partner get _value => super._value as _$_Partner;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? teamId = freezed,
    Object? type = freezed,
    Object? lastUpdatedAt = freezed,
  }) {
    return _then(_$_Partner(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PartnerType,
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Partner with DiagnosticableTreeMixin implements _Partner {
  const _$_Partner(
      {this.id,
      required this.name,
      required this.userId,
      required this.teamId,
      required this.type,
      required this.lastUpdatedAt});

  factory _$_Partner.fromJson(Map<String, dynamic> json) =>
      _$$_PartnerFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String userId;
  @override
  final String teamId;
  @override
  final PartnerType type;
  @override
  final int lastUpdatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Partner(id: $id, name: $name, userId: $userId, teamId: $teamId, type: $type, lastUpdatedAt: $lastUpdatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Partner'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('lastUpdatedAt', lastUpdatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Partner &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdatedAt, lastUpdatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(lastUpdatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_PartnerCopyWith<_$_Partner> get copyWith =>
      __$$_PartnerCopyWithImpl<_$_Partner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PartnerToJson(this);
  }
}

abstract class _Partner implements Partner {
  const factory _Partner(
      {final String? id,
      required final String name,
      required final String userId,
      required final String teamId,
      required final PartnerType type,
      required final int lastUpdatedAt}) = _$_Partner;

  factory _Partner.fromJson(Map<String, dynamic> json) = _$_Partner.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String get teamId => throw _privateConstructorUsedError;
  @override
  PartnerType get type => throw _privateConstructorUsedError;
  @override
  int get lastUpdatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PartnerCopyWith<_$_Partner> get copyWith =>
      throw _privateConstructorUsedError;
}
