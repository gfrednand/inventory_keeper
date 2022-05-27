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
  bool? get active => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get currentStock => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  DateTime? get summaryDate => throw _privateConstructorUsedError;

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
      {bool? active,
      String id,
      String name,
      int quantity,
      int currentStock,
      double? amount,
      @ServerTimestampConverter() DateTime? summaryDate});
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
    Object? active = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? quantity = freezed,
    Object? currentStock = freezed,
    Object? amount = freezed,
    Object? summaryDate = freezed,
  }) {
    return _then(_value.copyWith(
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      currentStock: currentStock == freezed
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      summaryDate: summaryDate == freezed
          ? _value.summaryDate
          : summaryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      {bool? active,
      String id,
      String name,
      int quantity,
      int currentStock,
      double? amount,
      @ServerTimestampConverter() DateTime? summaryDate});
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
    Object? active = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? quantity = freezed,
    Object? currentStock = freezed,
    Object? amount = freezed,
    Object? summaryDate = freezed,
  }) {
    return _then(_$_ProductSummary(
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      currentStock: currentStock == freezed
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      summaryDate: summaryDate == freezed
          ? _value.summaryDate
          : summaryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductSummary
    with DiagnosticableTreeMixin
    implements _ProductSummary {
  const _$_ProductSummary(
      {this.active,
      required this.id,
      required this.name,
      required this.quantity,
      required this.currentStock,
      this.amount,
      @ServerTimestampConverter() this.summaryDate});

  factory _$_ProductSummary.fromJson(Map<String, dynamic> json) =>
      _$$_ProductSummaryFromJson(json);

  @override
  final bool? active;
  @override
  final String id;
  @override
  final String name;
  @override
  final int quantity;
  @override
  final int currentStock;
  @override
  final double? amount;
  @override
  @ServerTimestampConverter()
  final DateTime? summaryDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductSummary(active: $active, id: $id, name: $name, quantity: $quantity, currentStock: $currentStock, amount: $amount, summaryDate: $summaryDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductSummary'))
      ..add(DiagnosticsProperty('active', active))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('currentStock', currentStock))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('summaryDate', summaryDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductSummary &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality()
                .equals(other.currentStock, currentStock) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality()
                .equals(other.summaryDate, summaryDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(active),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(currentStock),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(summaryDate));

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
          {final bool? active,
          required final String id,
          required final String name,
          required final int quantity,
          required final int currentStock,
          final double? amount,
          @ServerTimestampConverter() final DateTime? summaryDate}) =
      _$_ProductSummary;

  factory _ProductSummary.fromJson(Map<String, dynamic> json) =
      _$_ProductSummary.fromJson;

  @override
  bool? get active => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  int get currentStock => throw _privateConstructorUsedError;
  @override
  double? get amount => throw _privateConstructorUsedError;
  @override
  @ServerTimestampConverter()
  DateTime? get summaryDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductSummaryCopyWith<_$_ProductSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
