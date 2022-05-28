// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductTransaction _$ProductTransactionFromJson(Map<String, dynamic> json) {
  return _ProductTransaction.fromJson(json);
}

/// @nodoc
mixin _$ProductTransaction {
  TransactionType get transactionType => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  int get totalAuditedQuantity => throw _privateConstructorUsedError;
  int get transactionDate => throw _privateConstructorUsedError;
  List<ProductSummary> get productsSummary =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductTransactionCopyWith<ProductTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductTransactionCopyWith<$Res> {
  factory $ProductTransactionCopyWith(
          ProductTransaction value, $Res Function(ProductTransaction) then) =
      _$ProductTransactionCopyWithImpl<$Res>;
  $Res call(
      {TransactionType transactionType,
      double totalAmount,
      int totalQuantity,
      int totalAuditedQuantity,
      int transactionDate,
      List<ProductSummary> productsSummary});
}

/// @nodoc
class _$ProductTransactionCopyWithImpl<$Res>
    implements $ProductTransactionCopyWith<$Res> {
  _$ProductTransactionCopyWithImpl(this._value, this._then);

  final ProductTransaction _value;
  // ignore: unused_field
  final $Res Function(ProductTransaction) _then;

  @override
  $Res call({
    Object? transactionType = freezed,
    Object? totalAmount = freezed,
    Object? totalQuantity = freezed,
    Object? totalAuditedQuantity = freezed,
    Object? transactionDate = freezed,
    Object? productsSummary = freezed,
  }) {
    return _then(_value.copyWith(
      transactionType: transactionType == freezed
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalAuditedQuantity: totalAuditedQuantity == freezed
          ? _value.totalAuditedQuantity
          : totalAuditedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      transactionDate: transactionDate == freezed
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as int,
      productsSummary: productsSummary == freezed
          ? _value.productsSummary
          : productsSummary // ignore: cast_nullable_to_non_nullable
              as List<ProductSummary>,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductTransactionCopyWith<$Res>
    implements $ProductTransactionCopyWith<$Res> {
  factory _$$_ProductTransactionCopyWith(_$_ProductTransaction value,
          $Res Function(_$_ProductTransaction) then) =
      __$$_ProductTransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {TransactionType transactionType,
      double totalAmount,
      int totalQuantity,
      int totalAuditedQuantity,
      int transactionDate,
      List<ProductSummary> productsSummary});
}

/// @nodoc
class __$$_ProductTransactionCopyWithImpl<$Res>
    extends _$ProductTransactionCopyWithImpl<$Res>
    implements _$$_ProductTransactionCopyWith<$Res> {
  __$$_ProductTransactionCopyWithImpl(
      _$_ProductTransaction _value, $Res Function(_$_ProductTransaction) _then)
      : super(_value, (v) => _then(v as _$_ProductTransaction));

  @override
  _$_ProductTransaction get _value => super._value as _$_ProductTransaction;

  @override
  $Res call({
    Object? transactionType = freezed,
    Object? totalAmount = freezed,
    Object? totalQuantity = freezed,
    Object? totalAuditedQuantity = freezed,
    Object? transactionDate = freezed,
    Object? productsSummary = freezed,
  }) {
    return _then(_$_ProductTransaction(
      transactionType: transactionType == freezed
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalAuditedQuantity: totalAuditedQuantity == freezed
          ? _value.totalAuditedQuantity
          : totalAuditedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      transactionDate: transactionDate == freezed
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as int,
      productsSummary: productsSummary == freezed
          ? _value._productsSummary
          : productsSummary // ignore: cast_nullable_to_non_nullable
              as List<ProductSummary>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductTransaction
    with DiagnosticableTreeMixin
    implements _ProductTransaction {
  const _$_ProductTransaction(
      {required this.transactionType,
      required this.totalAmount,
      required this.totalQuantity,
      required this.totalAuditedQuantity,
      required this.transactionDate,
      required final List<ProductSummary> productsSummary})
      : _productsSummary = productsSummary;

  factory _$_ProductTransaction.fromJson(Map<String, dynamic> json) =>
      _$$_ProductTransactionFromJson(json);

  @override
  final TransactionType transactionType;
  @override
  final double totalAmount;
  @override
  final int totalQuantity;
  @override
  final int totalAuditedQuantity;
  @override
  final int transactionDate;
  final List<ProductSummary> _productsSummary;
  @override
  List<ProductSummary> get productsSummary {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsSummary);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductTransaction(transactionType: $transactionType, totalAmount: $totalAmount, totalQuantity: $totalQuantity, totalAuditedQuantity: $totalAuditedQuantity, transactionDate: $transactionDate, productsSummary: $productsSummary)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductTransaction'))
      ..add(DiagnosticsProperty('transactionType', transactionType))
      ..add(DiagnosticsProperty('totalAmount', totalAmount))
      ..add(DiagnosticsProperty('totalQuantity', totalQuantity))
      ..add(DiagnosticsProperty('totalAuditedQuantity', totalAuditedQuantity))
      ..add(DiagnosticsProperty('transactionDate', transactionDate))
      ..add(DiagnosticsProperty('productsSummary', productsSummary));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductTransaction &&
            const DeepCollectionEquality()
                .equals(other.transactionType, transactionType) &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality()
                .equals(other.totalQuantity, totalQuantity) &&
            const DeepCollectionEquality()
                .equals(other.totalAuditedQuantity, totalAuditedQuantity) &&
            const DeepCollectionEquality()
                .equals(other.transactionDate, transactionDate) &&
            const DeepCollectionEquality()
                .equals(other._productsSummary, _productsSummary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transactionType),
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(totalQuantity),
      const DeepCollectionEquality().hash(totalAuditedQuantity),
      const DeepCollectionEquality().hash(transactionDate),
      const DeepCollectionEquality().hash(_productsSummary));

  @JsonKey(ignore: true)
  @override
  _$$_ProductTransactionCopyWith<_$_ProductTransaction> get copyWith =>
      __$$_ProductTransactionCopyWithImpl<_$_ProductTransaction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductTransactionToJson(this);
  }
}

abstract class _ProductTransaction implements ProductTransaction {
  const factory _ProductTransaction(
          {required final TransactionType transactionType,
          required final double totalAmount,
          required final int totalQuantity,
          required final int totalAuditedQuantity,
          required final int transactionDate,
          required final List<ProductSummary> productsSummary}) =
      _$_ProductTransaction;

  factory _ProductTransaction.fromJson(Map<String, dynamic> json) =
      _$_ProductTransaction.fromJson;

  @override
  TransactionType get transactionType => throw _privateConstructorUsedError;
  @override
  double get totalAmount => throw _privateConstructorUsedError;
  @override
  int get totalQuantity => throw _privateConstructorUsedError;
  @override
  int get totalAuditedQuantity => throw _privateConstructorUsedError;
  @override
  int get transactionDate => throw _privateConstructorUsedError;
  @override
  List<ProductSummary> get productsSummary =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductTransactionCopyWith<_$_ProductTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
