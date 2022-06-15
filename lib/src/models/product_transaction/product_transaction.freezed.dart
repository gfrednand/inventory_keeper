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
  String? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get teamId => throw _privateConstructorUsedError;
  bool get isPastTransaction => throw _privateConstructorUsedError;
  TransactionType get transactionType => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  int get totalAuditQuantity => throw _privateConstructorUsedError;
  Partner? get partner => throw _privateConstructorUsedError;
  List<ProductSummary> get productsSummary =>
      throw _privateConstructorUsedError;
  int get lastUpdatedAt => throw _privateConstructorUsedError;
  int? get transactionDate => throw _privateConstructorUsedError;

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
      {String? id,
      String userId,
      String teamId,
      bool isPastTransaction,
      TransactionType transactionType,
      double totalAmount,
      int totalQuantity,
      int totalAuditQuantity,
      Partner? partner,
      List<ProductSummary> productsSummary,
      int lastUpdatedAt,
      int? transactionDate});

  $PartnerCopyWith<$Res>? get partner;
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
    Object? id = freezed,
    Object? userId = freezed,
    Object? teamId = freezed,
    Object? isPastTransaction = freezed,
    Object? transactionType = freezed,
    Object? totalAmount = freezed,
    Object? totalQuantity = freezed,
    Object? totalAuditQuantity = freezed,
    Object? partner = freezed,
    Object? productsSummary = freezed,
    Object? lastUpdatedAt = freezed,
    Object? transactionDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      isPastTransaction: isPastTransaction == freezed
          ? _value.isPastTransaction
          : isPastTransaction // ignore: cast_nullable_to_non_nullable
              as bool,
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
      totalAuditQuantity: totalAuditQuantity == freezed
          ? _value.totalAuditQuantity
          : totalAuditQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      partner: partner == freezed
          ? _value.partner
          : partner // ignore: cast_nullable_to_non_nullable
              as Partner?,
      productsSummary: productsSummary == freezed
          ? _value.productsSummary
          : productsSummary // ignore: cast_nullable_to_non_nullable
              as List<ProductSummary>,
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      transactionDate: transactionDate == freezed
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $PartnerCopyWith<$Res>? get partner {
    if (_value.partner == null) {
      return null;
    }

    return $PartnerCopyWith<$Res>(_value.partner!, (value) {
      return _then(_value.copyWith(partner: value));
    });
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
      {String? id,
      String userId,
      String teamId,
      bool isPastTransaction,
      TransactionType transactionType,
      double totalAmount,
      int totalQuantity,
      int totalAuditQuantity,
      Partner? partner,
      List<ProductSummary> productsSummary,
      int lastUpdatedAt,
      int? transactionDate});

  @override
  $PartnerCopyWith<$Res>? get partner;
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
    Object? id = freezed,
    Object? userId = freezed,
    Object? teamId = freezed,
    Object? isPastTransaction = freezed,
    Object? transactionType = freezed,
    Object? totalAmount = freezed,
    Object? totalQuantity = freezed,
    Object? totalAuditQuantity = freezed,
    Object? partner = freezed,
    Object? productsSummary = freezed,
    Object? lastUpdatedAt = freezed,
    Object? transactionDate = freezed,
  }) {
    return _then(_$_ProductTransaction(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      isPastTransaction: isPastTransaction == freezed
          ? _value.isPastTransaction
          : isPastTransaction // ignore: cast_nullable_to_non_nullable
              as bool,
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
      totalAuditQuantity: totalAuditQuantity == freezed
          ? _value.totalAuditQuantity
          : totalAuditQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      partner: partner == freezed
          ? _value.partner
          : partner // ignore: cast_nullable_to_non_nullable
              as Partner?,
      productsSummary: productsSummary == freezed
          ? _value._productsSummary
          : productsSummary // ignore: cast_nullable_to_non_nullable
              as List<ProductSummary>,
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      transactionDate: transactionDate == freezed
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductTransaction
    with DiagnosticableTreeMixin
    implements _ProductTransaction {
  const _$_ProductTransaction(
      {this.id,
      required this.userId,
      required this.teamId,
      this.isPastTransaction = false,
      required this.transactionType,
      required this.totalAmount,
      required this.totalQuantity,
      this.totalAuditQuantity = 0,
      this.partner,
      required final List<ProductSummary> productsSummary,
      required this.lastUpdatedAt,
      this.transactionDate})
      : _productsSummary = productsSummary;

  factory _$_ProductTransaction.fromJson(Map<String, dynamic> json) =>
      _$$_ProductTransactionFromJson(json);

  @override
  final String? id;
  @override
  final String userId;
  @override
  final String teamId;
  @override
  @JsonKey()
  final bool isPastTransaction;
  @override
  final TransactionType transactionType;
  @override
  final double totalAmount;
  @override
  final int totalQuantity;
  @override
  @JsonKey()
  final int totalAuditQuantity;
  @override
  final Partner? partner;
  final List<ProductSummary> _productsSummary;
  @override
  List<ProductSummary> get productsSummary {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsSummary);
  }

  @override
  final int lastUpdatedAt;
  @override
  final int? transactionDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductTransaction(id: $id, userId: $userId, teamId: $teamId, isPastTransaction: $isPastTransaction, transactionType: $transactionType, totalAmount: $totalAmount, totalQuantity: $totalQuantity, totalAuditQuantity: $totalAuditQuantity, partner: $partner, productsSummary: $productsSummary, lastUpdatedAt: $lastUpdatedAt, transactionDate: $transactionDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductTransaction'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('isPastTransaction', isPastTransaction))
      ..add(DiagnosticsProperty('transactionType', transactionType))
      ..add(DiagnosticsProperty('totalAmount', totalAmount))
      ..add(DiagnosticsProperty('totalQuantity', totalQuantity))
      ..add(DiagnosticsProperty('totalAuditQuantity', totalAuditQuantity))
      ..add(DiagnosticsProperty('partner', partner))
      ..add(DiagnosticsProperty('productsSummary', productsSummary))
      ..add(DiagnosticsProperty('lastUpdatedAt', lastUpdatedAt))
      ..add(DiagnosticsProperty('transactionDate', transactionDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductTransaction &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality()
                .equals(other.isPastTransaction, isPastTransaction) &&
            const DeepCollectionEquality()
                .equals(other.transactionType, transactionType) &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality()
                .equals(other.totalQuantity, totalQuantity) &&
            const DeepCollectionEquality()
                .equals(other.totalAuditQuantity, totalAuditQuantity) &&
            const DeepCollectionEquality().equals(other.partner, partner) &&
            const DeepCollectionEquality()
                .equals(other._productsSummary, _productsSummary) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdatedAt, lastUpdatedAt) &&
            const DeepCollectionEquality()
                .equals(other.transactionDate, transactionDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(isPastTransaction),
      const DeepCollectionEquality().hash(transactionType),
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(totalQuantity),
      const DeepCollectionEquality().hash(totalAuditQuantity),
      const DeepCollectionEquality().hash(partner),
      const DeepCollectionEquality().hash(_productsSummary),
      const DeepCollectionEquality().hash(lastUpdatedAt),
      const DeepCollectionEquality().hash(transactionDate));

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
      {final String? id,
      required final String userId,
      required final String teamId,
      final bool isPastTransaction,
      required final TransactionType transactionType,
      required final double totalAmount,
      required final int totalQuantity,
      final int totalAuditQuantity,
      final Partner? partner,
      required final List<ProductSummary> productsSummary,
      required final int lastUpdatedAt,
      final int? transactionDate}) = _$_ProductTransaction;

  factory _ProductTransaction.fromJson(Map<String, dynamic> json) =
      _$_ProductTransaction.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String get teamId => throw _privateConstructorUsedError;
  @override
  bool get isPastTransaction => throw _privateConstructorUsedError;
  @override
  TransactionType get transactionType => throw _privateConstructorUsedError;
  @override
  double get totalAmount => throw _privateConstructorUsedError;
  @override
  int get totalQuantity => throw _privateConstructorUsedError;
  @override
  int get totalAuditQuantity => throw _privateConstructorUsedError;
  @override
  Partner? get partner => throw _privateConstructorUsedError;
  @override
  List<ProductSummary> get productsSummary =>
      throw _privateConstructorUsedError;
  @override
  int get lastUpdatedAt => throw _privateConstructorUsedError;
  @override
  int? get transactionDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductTransactionCopyWith<_$_ProductTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
