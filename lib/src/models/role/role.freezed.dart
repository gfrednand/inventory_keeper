// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'role.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Role _$RoleFromJson(Map<String, dynamic> json) {
  return _Role.fromJson(json);
}

/// @nodoc
mixin _$Role {
  String? get id => throw _privateConstructorUsedError;
  String get teamId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get lastUpdatedAt => throw _privateConstructorUsedError;
  List<Permission> get permissions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleCopyWith<Role> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleCopyWith<$Res> {
  factory $RoleCopyWith(Role value, $Res Function(Role) then) =
      _$RoleCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String teamId,
      String name,
      int lastUpdatedAt,
      List<Permission> permissions});
}

/// @nodoc
class _$RoleCopyWithImpl<$Res> implements $RoleCopyWith<$Res> {
  _$RoleCopyWithImpl(this._value, this._then);

  final Role _value;
  // ignore: unused_field
  final $Res Function(Role) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? teamId = freezed,
    Object? name = freezed,
    Object? lastUpdatedAt = freezed,
    Object? permissions = freezed,
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
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      permissions: permissions == freezed
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<Permission>,
    ));
  }
}

/// @nodoc
abstract class _$$_RoleCopyWith<$Res> implements $RoleCopyWith<$Res> {
  factory _$$_RoleCopyWith(_$_Role value, $Res Function(_$_Role) then) =
      __$$_RoleCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String teamId,
      String name,
      int lastUpdatedAt,
      List<Permission> permissions});
}

/// @nodoc
class __$$_RoleCopyWithImpl<$Res> extends _$RoleCopyWithImpl<$Res>
    implements _$$_RoleCopyWith<$Res> {
  __$$_RoleCopyWithImpl(_$_Role _value, $Res Function(_$_Role) _then)
      : super(_value, (v) => _then(v as _$_Role));

  @override
  _$_Role get _value => super._value as _$_Role;

  @override
  $Res call({
    Object? id = freezed,
    Object? teamId = freezed,
    Object? name = freezed,
    Object? lastUpdatedAt = freezed,
    Object? permissions = freezed,
  }) {
    return _then(_$_Role(
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
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      permissions: permissions == freezed
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<Permission>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Role with DiagnosticableTreeMixin implements _Role {
  const _$_Role(
      {this.id,
      required this.teamId,
      required this.name,
      required this.lastUpdatedAt,
      required final List<Permission> permissions})
      : _permissions = permissions;

  factory _$_Role.fromJson(Map<String, dynamic> json) => _$$_RoleFromJson(json);

  @override
  final String? id;
  @override
  final String teamId;
  @override
  final String name;
  @override
  final int lastUpdatedAt;
  final List<Permission> _permissions;
  @override
  List<Permission> get permissions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Role(id: $id, teamId: $teamId, name: $name, lastUpdatedAt: $lastUpdatedAt, permissions: $permissions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Role'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('lastUpdatedAt', lastUpdatedAt))
      ..add(DiagnosticsProperty('permissions', permissions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Role &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdatedAt, lastUpdatedAt) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(lastUpdatedAt),
      const DeepCollectionEquality().hash(_permissions));

  @JsonKey(ignore: true)
  @override
  _$$_RoleCopyWith<_$_Role> get copyWith =>
      __$$_RoleCopyWithImpl<_$_Role>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoleToJson(this);
  }
}

abstract class _Role implements Role {
  const factory _Role(
      {final String? id,
      required final String teamId,
      required final String name,
      required final int lastUpdatedAt,
      required final List<Permission> permissions}) = _$_Role;

  factory _Role.fromJson(Map<String, dynamic> json) = _$_Role.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get teamId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get lastUpdatedAt => throw _privateConstructorUsedError;
  @override
  List<Permission> get permissions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoleCopyWith<_$_Role> get copyWith => throw _privateConstructorUsedError;
}
