// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductSummary _$ProductSummaryFromJson(Map<String, dynamic> json) {
  return _ProductSummary.fromJson(json);
}

/// @nodoc
mixin _$ProductSummary {
  String? get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get auditedQuantity => throw _privateConstructorUsedError;
  int get currentStock => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  int get lastUpdatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductSummaryCopyWith<ProductSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSummaryCopyWith<$Res> {
  factory $ProductSummaryCopyWith(
          ProductSummary value, $Res Function(ProductSummary) then) =
      _$ProductSummaryCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String productId,
      int quantity,
      int auditedQuantity,
      int currentStock,
      double amount,
      int lastUpdatedAt});
}

/// @nodoc
class _$ProductSummaryCopyWithImpl<$Res>
    implements $ProductSummaryCopyWith<$Res> {
  _$ProductSummaryCopyWithImpl(this._value, this._then);

  final ProductSummary _value;
  // ignore: unused_field
  final $Res Function(ProductSummary) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? quantity = freezed,
    Object? auditedQuantity = freezed,
    Object? currentStock = freezed,
    Object? amount = freezed,
    Object? lastUpdatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      auditedQuantity: auditedQuantity == freezed
          ? _value.auditedQuantity
          : auditedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      currentStock: currentStock == freezed
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductSummaryCopyWith<$Res>
    implements $ProductSummaryCopyWith<$Res> {
  factory _$$_ProductSummaryCopyWith(
          _$_ProductSummary value, $Res Function(_$_ProductSummary) then) =
      __$$_ProductSummaryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String productId,
      int quantity,
      int auditedQuantity,
      int currentStock,
      double amount,
      int lastUpdatedAt});
}

/// @nodoc
class __$$_ProductSummaryCopyWithImpl<$Res>
    extends _$ProductSummaryCopyWithImpl<$Res>
    implements _$$_ProductSummaryCopyWith<$Res> {
  __$$_ProductSummaryCopyWithImpl(
      _$_ProductSummary _value, $Res Function(_$_ProductSummary) _then)
      : super(_value, (v) => _then(v as _$_ProductSummary));

  @override
  _$_ProductSummary get _value => super._value as _$_ProductSummary;

  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? quantity = freezed,
    Object? auditedQuantity = freezed,
    Object? currentStock = freezed,
    Object? amount = freezed,
    Object? lastUpdatedAt = freezed,
  }) {
    return _then(_$_ProductSummary(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      auditedQuantity: auditedQuantity == freezed
          ? _value.auditedQuantity
          : auditedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      currentStock: currentStock == freezed
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductSummary
    with DiagnosticableTreeMixin
    implements _ProductSummary {
  const _$_ProductSummary(
      {this.id,
      required this.productId,
      this.quantity = 0,
      this.auditedQuantity = 0,
      this.currentStock = 0,
      this.amount = 0,
      required this.lastUpdatedAt});

  factory _$_ProductSummary.fromJson(Map<String, dynamic> json) =>
      _$$_ProductSummaryFromJson(json);

  @override
  final String? id;
  @override
  final String productId;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final int auditedQuantity;
  @override
  @JsonKey()
  final int currentStock;
  @override
  @JsonKey()
  final double amount;
  @override
  final int lastUpdatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductSummary(id: $id, productId: $productId, quantity: $quantity, auditedQuantity: $auditedQuantity, currentStock: $currentStock, amount: $amount, lastUpdatedAt: $lastUpdatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductSummary'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('productId', productId))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('auditedQuantity', auditedQuantity))
      ..add(DiagnosticsProperty('currentStock', currentStock))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('lastUpdatedAt', lastUpdatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductSummary &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.productId, productId) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality()
                .equals(other.auditedQuantity, auditedQuantity) &&
            const DeepCollectionEquality()
                .equals(other.currentStock, currentStock) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdatedAt, lastUpdatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(productId),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(auditedQuantity),
      const DeepCollectionEquality().hash(currentStock),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(lastUpdatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_ProductSummaryCopyWith<_$_ProductSummary> get copyWith =>
      __$$_ProductSummaryCopyWithImpl<_$_ProductSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductSummaryToJson(this);
  }
}

abstract class _ProductSummary implements ProductSummary {
  const factory _ProductSummary(
      {final String? id,
      required final String productId,
      final int quantity,
      final int auditedQuantity,
      final int currentStock,
      final double amount,
      required final int lastUpdatedAt}) = _$_ProductSummary;

  factory _ProductSummary.fromJson(Map<String, dynamic> json) =
      _$_ProductSummary.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get productId => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  int get auditedQuantity => throw _privateConstructorUsedError;
  @override
  int get currentStock => throw _privateConstructorUsedError;
  @override
  double get amount => throw _privateConstructorUsedError;
  @override
  int get lastUpdatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductSummaryCopyWith<_$_ProductSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
