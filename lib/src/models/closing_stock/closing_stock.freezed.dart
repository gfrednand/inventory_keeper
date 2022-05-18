// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'closing_stock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClosingStock _$ClosingStockFromJson(Map<String, dynamic> json) {
  return _ClosingStock.fromJson(json);
}

/// @nodoc
mixin _$ClosingStock {
  DateTime get date => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClosingStockCopyWith<ClosingStock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosingStockCopyWith<$Res> {
  factory $ClosingStockCopyWith(
          ClosingStock value, $Res Function(ClosingStock) then) =
      _$ClosingStockCopyWithImpl<$Res>;
  $Res call({DateTime date, List<Product> products});
}

/// @nodoc
class _$ClosingStockCopyWithImpl<$Res> implements $ClosingStockCopyWith<$Res> {
  _$ClosingStockCopyWithImpl(this._value, this._then);

  final ClosingStock _value;
  // ignore: unused_field
  final $Res Function(ClosingStock) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc
abstract class _$$_ClosingStockCopyWith<$Res>
    implements $ClosingStockCopyWith<$Res> {
  factory _$$_ClosingStockCopyWith(
          _$_ClosingStock value, $Res Function(_$_ClosingStock) then) =
      __$$_ClosingStockCopyWithImpl<$Res>;
  @override
  $Res call({DateTime date, List<Product> products});
}

/// @nodoc
class __$$_ClosingStockCopyWithImpl<$Res>
    extends _$ClosingStockCopyWithImpl<$Res>
    implements _$$_ClosingStockCopyWith<$Res> {
  __$$_ClosingStockCopyWithImpl(
      _$_ClosingStock _value, $Res Function(_$_ClosingStock) _then)
      : super(_value, (v) => _then(v as _$_ClosingStock));

  @override
  _$_ClosingStock get _value => super._value as _$_ClosingStock;

  @override
  $Res call({
    Object? date = freezed,
    Object? products = freezed,
  }) {
    return _then(_$_ClosingStock(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClosingStock with DiagnosticableTreeMixin implements _ClosingStock {
  const _$_ClosingStock(
      {required this.date, required final List<Product> products})
      : _products = products;

  factory _$_ClosingStock.fromJson(Map<String, dynamic> json) =>
      _$$_ClosingStockFromJson(json);

  @override
  final DateTime date;
  final List<Product> _products;
  @override
  List<Product> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClosingStock(date: $date, products: $products)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClosingStock'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('products', products));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClosingStock &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  _$$_ClosingStockCopyWith<_$_ClosingStock> get copyWith =>
      __$$_ClosingStockCopyWithImpl<_$_ClosingStock>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClosingStockToJson(this);
  }
}

abstract class _ClosingStock implements ClosingStock {
  const factory _ClosingStock(
      {required final DateTime date,
      required final List<Product> products}) = _$_ClosingStock;

  factory _ClosingStock.fromJson(Map<String, dynamic> json) =
      _$_ClosingStock.fromJson;

  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  List<Product> get products => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ClosingStockCopyWith<_$_ClosingStock> get copyWith =>
      throw _privateConstructorUsedError;
}
