// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stock _$StockFromJson(Map<String, dynamic> json) {
  return _Stock.fromJson(json);
}

/// @nodoc
mixin _$Stock {
  List<ProductSummary> get productsSummary =>
      throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  int get totalIn => throw _privateConstructorUsedError;
  int get totalOut => throw _privateConstructorUsedError;
  double get totalSale => throw _privateConstructorUsedError;
  double get totalBuy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockCopyWith<Stock> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCopyWith<$Res> {
  factory $StockCopyWith(Stock value, $Res Function(Stock) then) =
      _$StockCopyWithImpl<$Res>;
  $Res call(
      {List<ProductSummary> productsSummary,
      double totalAmount,
      int totalQuantity,
      int totalIn,
      int totalOut,
      double totalSale,
      double totalBuy});
}

/// @nodoc
class _$StockCopyWithImpl<$Res> implements $StockCopyWith<$Res> {
  _$StockCopyWithImpl(this._value, this._then);

  final Stock _value;
  // ignore: unused_field
  final $Res Function(Stock) _then;

  @override
  $Res call({
    Object? productsSummary = freezed,
    Object? totalAmount = freezed,
    Object? totalQuantity = freezed,
    Object? totalIn = freezed,
    Object? totalOut = freezed,
    Object? totalSale = freezed,
    Object? totalBuy = freezed,
  }) {
    return _then(_value.copyWith(
      productsSummary: productsSummary == freezed
          ? _value.productsSummary
          : productsSummary // ignore: cast_nullable_to_non_nullable
              as List<ProductSummary>,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalIn: totalIn == freezed
          ? _value.totalIn
          : totalIn // ignore: cast_nullable_to_non_nullable
              as int,
      totalOut: totalOut == freezed
          ? _value.totalOut
          : totalOut // ignore: cast_nullable_to_non_nullable
              as int,
      totalSale: totalSale == freezed
          ? _value.totalSale
          : totalSale // ignore: cast_nullable_to_non_nullable
              as double,
      totalBuy: totalBuy == freezed
          ? _value.totalBuy
          : totalBuy // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_StockCopyWith<$Res> implements $StockCopyWith<$Res> {
  factory _$$_StockCopyWith(_$_Stock value, $Res Function(_$_Stock) then) =
      __$$_StockCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ProductSummary> productsSummary,
      double totalAmount,
      int totalQuantity,
      int totalIn,
      int totalOut,
      double totalSale,
      double totalBuy});
}

/// @nodoc
class __$$_StockCopyWithImpl<$Res> extends _$StockCopyWithImpl<$Res>
    implements _$$_StockCopyWith<$Res> {
  __$$_StockCopyWithImpl(_$_Stock _value, $Res Function(_$_Stock) _then)
      : super(_value, (v) => _then(v as _$_Stock));

  @override
  _$_Stock get _value => super._value as _$_Stock;

  @override
  $Res call({
    Object? productsSummary = freezed,
    Object? totalAmount = freezed,
    Object? totalQuantity = freezed,
    Object? totalIn = freezed,
    Object? totalOut = freezed,
    Object? totalSale = freezed,
    Object? totalBuy = freezed,
  }) {
    return _then(_$_Stock(
      productsSummary: productsSummary == freezed
          ? _value._productsSummary
          : productsSummary // ignore: cast_nullable_to_non_nullable
              as List<ProductSummary>,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalIn: totalIn == freezed
          ? _value.totalIn
          : totalIn // ignore: cast_nullable_to_non_nullable
              as int,
      totalOut: totalOut == freezed
          ? _value.totalOut
          : totalOut // ignore: cast_nullable_to_non_nullable
              as int,
      totalSale: totalSale == freezed
          ? _value.totalSale
          : totalSale // ignore: cast_nullable_to_non_nullable
              as double,
      totalBuy: totalBuy == freezed
          ? _value.totalBuy
          : totalBuy // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stock with DiagnosticableTreeMixin implements _Stock {
  const _$_Stock(
      {required final List<ProductSummary> productsSummary,
      required this.totalAmount,
      required this.totalQuantity,
      required this.totalIn,
      required this.totalOut,
      required this.totalSale,
      required this.totalBuy})
      : _productsSummary = productsSummary;

  factory _$_Stock.fromJson(Map<String, dynamic> json) =>
      _$$_StockFromJson(json);

  final List<ProductSummary> _productsSummary;
  @override
  List<ProductSummary> get productsSummary {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsSummary);
  }

  @override
  final double totalAmount;
  @override
  final int totalQuantity;
  @override
  final int totalIn;
  @override
  final int totalOut;
  @override
  final double totalSale;
  @override
  final double totalBuy;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Stock(productsSummary: $productsSummary, totalAmount: $totalAmount, totalQuantity: $totalQuantity, totalIn: $totalIn, totalOut: $totalOut, totalSale: $totalSale, totalBuy: $totalBuy)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Stock'))
      ..add(DiagnosticsProperty('productsSummary', productsSummary))
      ..add(DiagnosticsProperty('totalAmount', totalAmount))
      ..add(DiagnosticsProperty('totalQuantity', totalQuantity))
      ..add(DiagnosticsProperty('totalIn', totalIn))
      ..add(DiagnosticsProperty('totalOut', totalOut))
      ..add(DiagnosticsProperty('totalSale', totalSale))
      ..add(DiagnosticsProperty('totalBuy', totalBuy));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stock &&
            const DeepCollectionEquality()
                .equals(other._productsSummary, _productsSummary) &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality()
                .equals(other.totalQuantity, totalQuantity) &&
            const DeepCollectionEquality().equals(other.totalIn, totalIn) &&
            const DeepCollectionEquality().equals(other.totalOut, totalOut) &&
            const DeepCollectionEquality().equals(other.totalSale, totalSale) &&
            const DeepCollectionEquality().equals(other.totalBuy, totalBuy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productsSummary),
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(totalQuantity),
      const DeepCollectionEquality().hash(totalIn),
      const DeepCollectionEquality().hash(totalOut),
      const DeepCollectionEquality().hash(totalSale),
      const DeepCollectionEquality().hash(totalBuy));

  @JsonKey(ignore: true)
  @override
  _$$_StockCopyWith<_$_Stock> get copyWith =>
      __$$_StockCopyWithImpl<_$_Stock>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StockToJson(this);
  }
}

abstract class _Stock implements Stock {
  const factory _Stock(
      {required final List<ProductSummary> productsSummary,
      required final double totalAmount,
      required final int totalQuantity,
      required final int totalIn,
      required final int totalOut,
      required final double totalSale,
      required final double totalBuy}) = _$_Stock;

  factory _Stock.fromJson(Map<String, dynamic> json) = _$_Stock.fromJson;

  @override
  List<ProductSummary> get productsSummary =>
      throw _privateConstructorUsedError;
  @override
  double get totalAmount => throw _privateConstructorUsedError;
  @override
  int get totalQuantity => throw _privateConstructorUsedError;
  @override
  int get totalIn => throw _privateConstructorUsedError;
  @override
  int get totalOut => throw _privateConstructorUsedError;
  @override
  double get totalSale => throw _privateConstructorUsedError;
  @override
  double get totalBuy => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StockCopyWith<_$_Stock> get copyWith =>
      throw _privateConstructorUsedError;
}
