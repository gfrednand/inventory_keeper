// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'permission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return _Permission.fromJson(json);
}

/// @nodoc
mixin _$Permission {
  String? get id => throw _privateConstructorUsedError;
  String get teamId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionCopyWith<Permission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionCopyWith<$Res> {
  factory $PermissionCopyWith(
          Permission value, $Res Function(Permission) then) =
      _$PermissionCopyWithImpl<$Res>;
  $Res call({String? id, String teamId, String name, bool active});
}

/// @nodoc
class _$PermissionCopyWithImpl<$Res> implements $PermissionCopyWith<$Res> {
  _$PermissionCopyWithImpl(this._value, this._then);

  final Permission _value;
  // ignore: unused_field
  final $Res Function(Permission) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? teamId = freezed,
    Object? name = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PermissionCopyWith<$Res>
    implements $PermissionCopyWith<$Res> {
  factory _$$_PermissionCopyWith(
          _$_Permission value, $Res Function(_$_Permission) then) =
      __$$_PermissionCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String teamId, String name, bool active});
}

/// @nodoc
class __$$_PermissionCopyWithImpl<$Res> extends _$PermissionCopyWithImpl<$Res>
    implements _$$_PermissionCopyWith<$Res> {
  __$$_PermissionCopyWithImpl(
      _$_Permission _value, $Res Function(_$_Permission) _then)
      : super(_value, (v) => _then(v as _$_Permission));

  @override
  _$_Permission get _value => super._value as _$_Permission;

  @override
  $Res call({
    Object? id = freezed,
    Object? teamId = freezed,
    Object? name = freezed,
    Object? active = freezed,
  }) {
    return _then(_$_Permission(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Permission with DiagnosticableTreeMixin implements _Permission {
  const _$_Permission(
      {this.id,
      required this.teamId,
      required this.name,
      required this.active});

  factory _$_Permission.fromJson(Map<String, dynamic> json) =>
      _$$_PermissionFromJson(json);

  @override
  final String? id;
  @override
  final String teamId;
  @override
  final String name;
  @override
  final bool active;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Permission(id: $id, teamId: $teamId, name: $name, active: $active)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Permission'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('active', active));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Permission &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.active, active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(active));

  @JsonKey(ignore: true)
  @override
  _$$_PermissionCopyWith<_$_Permission> get copyWith =>
      __$$_PermissionCopyWithImpl<_$_Permission>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PermissionToJson(this);
  }
}

abstract class _Permission implements Permission {
  const factory _Permission(
      {final String? id,
      required final String teamId,
      required final String name,
      required final bool active}) = _$_Permission;

  factory _Permission.fromJson(Map<String, dynamic> json) =
      _$_Permission.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get teamId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  bool get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PermissionCopyWith<_$_Permission> get copyWith =>
      throw _privateConstructorUsedError;
}
