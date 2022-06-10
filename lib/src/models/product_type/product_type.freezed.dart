// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductType _$ProductTypeFromJson(Map<String, dynamic> json) {
  return _ProductType.fromJson(json);
}

/// @nodoc
mixin _$ProductType {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get lastUpdatedAt => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductTypeCopyWith<ProductType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductTypeCopyWith<$Res> {
  factory $ProductTypeCopyWith(
          ProductType value, $Res Function(ProductType) then) =
      _$ProductTypeCopyWithImpl<$Res>;
  $Res call({String? id, String name, int lastUpdatedAt, String userId});
}

/// @nodoc
class _$ProductTypeCopyWithImpl<$Res> implements $ProductTypeCopyWith<$Res> {
  _$ProductTypeCopyWithImpl(this._value, this._then);

  final ProductType _value;
  // ignore: unused_field
  final $Res Function(ProductType) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lastUpdatedAt = freezed,
    Object? userId = freezed,
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
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductTypeCopyWith<$Res>
    implements $ProductTypeCopyWith<$Res> {
  factory _$$_ProductTypeCopyWith(
          _$_ProductType value, $Res Function(_$_ProductType) then) =
      __$$_ProductTypeCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String name, int lastUpdatedAt, String userId});
}

/// @nodoc
class __$$_ProductTypeCopyWithImpl<$Res> extends _$ProductTypeCopyWithImpl<$Res>
    implements _$$_ProductTypeCopyWith<$Res> {
  __$$_ProductTypeCopyWithImpl(
      _$_ProductType _value, $Res Function(_$_ProductType) _then)
      : super(_value, (v) => _then(v as _$_ProductType));

  @override
  _$_ProductType get _value => super._value as _$_ProductType;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lastUpdatedAt = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_ProductType(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductType with DiagnosticableTreeMixin implements _ProductType {
  const _$_ProductType(
      {this.id,
      required this.name,
      required this.lastUpdatedAt,
      required this.userId});

  factory _$_ProductType.fromJson(Map<String, dynamic> json) =>
      _$$_ProductTypeFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final int lastUpdatedAt;
  @override
  final String userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductType(id: $id, name: $name, lastUpdatedAt: $lastUpdatedAt, userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductType'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('lastUpdatedAt', lastUpdatedAt))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductType &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdatedAt, lastUpdatedAt) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(lastUpdatedAt),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_ProductTypeCopyWith<_$_ProductType> get copyWith =>
      __$$_ProductTypeCopyWithImpl<_$_ProductType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductTypeToJson(this);
  }
}

abstract class _ProductType implements ProductType {
  const factory _ProductType(
      {final String? id,
      required final String name,
      required final int lastUpdatedAt,
      required final String userId}) = _$_ProductType;

  factory _ProductType.fromJson(Map<String, dynamic> json) =
      _$_ProductType.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get lastUpdatedAt => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductTypeCopyWith<_$_ProductType> get copyWith =>
      throw _privateConstructorUsedError;
}
