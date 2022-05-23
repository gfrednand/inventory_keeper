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
  String get createdAt => throw _privateConstructorUsedError;
  List<ProductSummary> get productsSummary =>
      throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  List<Transaction> get transactions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockCopyWith<Stock> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCopyWith<$Res> {
  factory $StockCopyWith(Stock value, $Res Function(Stock) then) =
      _$StockCopyWithImpl<$Res>;
  $Res call(
      {String createdAt,
      List<ProductSummary> productsSummary,
      double totalAmount,
      int totalQuantity,
      List<Transaction> transactions});
}

/// @nodoc
class _$StockCopyWithImpl<$Res> implements $StockCopyWith<$Res> {
  _$StockCopyWithImpl(this._value, this._then);

  final Stock _value;
  // ignore: unused_field
  final $Res Function(Stock) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? productsSummary = freezed,
    Object? totalAmount = freezed,
    Object? totalQuantity = freezed,
    Object? transactions = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
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
      transactions: transactions == freezed
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc
abstract class _$$_StockCopyWith<$Res> implements $StockCopyWith<$Res> {
  factory _$$_StockCopyWith(_$_Stock value, $Res Function(_$_Stock) then) =
      __$$_StockCopyWithImpl<$Res>;
  @override
  $Res call(
      {String createdAt,
      List<ProductSummary> productsSummary,
      double totalAmount,
      int totalQuantity,
      List<Transaction> transactions});
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
    Object? createdAt = freezed,
    Object? productsSummary = freezed,
    Object? totalAmount = freezed,
    Object? totalQuantity = freezed,
    Object? transactions = freezed,
  }) {
    return _then(_$_Stock(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
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
      transactions: transactions == freezed
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stock with DiagnosticableTreeMixin implements _Stock {
  const _$_Stock(
      {required this.createdAt,
      required final List<ProductSummary> productsSummary,
      required this.totalAmount,
      required this.totalQuantity,
      required final List<Transaction> transactions})
      : _productsSummary = productsSummary,
        _transactions = transactions;

  factory _$_Stock.fromJson(Map<String, dynamic> json) =>
      _$$_StockFromJson(json);

  @override
  final String createdAt;
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
  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Stock(createdAt: $createdAt, productsSummary: $productsSummary, totalAmount: $totalAmount, totalQuantity: $totalQuantity, transactions: $transactions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Stock'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('productsSummary', productsSummary))
      ..add(DiagnosticsProperty('totalAmount', totalAmount))
      ..add(DiagnosticsProperty('totalQuantity', totalQuantity))
      ..add(DiagnosticsProperty('transactions', transactions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stock &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other._productsSummary, _productsSummary) &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality()
                .equals(other.totalQuantity, totalQuantity) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(_productsSummary),
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(totalQuantity),
      const DeepCollectionEquality().hash(_transactions));

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
      {required final String createdAt,
      required final List<ProductSummary> productsSummary,
      required final double totalAmount,
      required final int totalQuantity,
      required final List<Transaction> transactions}) = _$_Stock;

  factory _Stock.fromJson(Map<String, dynamic> json) = _$_Stock.fromJson;

  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  List<ProductSummary> get productsSummary =>
      throw _privateConstructorUsedError;
  @override
  double get totalAmount => throw _privateConstructorUsedError;
  @override
  int get totalQuantity => throw _privateConstructorUsedError;
  @override
  List<Transaction> get transactions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StockCopyWith<_$_Stock> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductSummary _$ProductSummaryFromJson(Map<String, dynamic> json) {
  return _ProductSummary.fromJson(json);
}

/// @nodoc
mixin _$ProductSummary {
  bool get active => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get currentStock => throw _privateConstructorUsedError;
  double get buyPrice => throw _privateConstructorUsedError;
  double get salePrice => throw _privateConstructorUsedError;
  DateTime get summaryDate => throw _privateConstructorUsedError;

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
      {bool active,
      String id,
      String name,
      int currentStock,
      double buyPrice,
      double salePrice,
      DateTime summaryDate});
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
    Object? currentStock = freezed,
    Object? buyPrice = freezed,
    Object? salePrice = freezed,
    Object? summaryDate = freezed,
  }) {
    return _then(_value.copyWith(
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentStock: currentStock == freezed
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
      buyPrice: buyPrice == freezed
          ? _value.buyPrice
          : buyPrice // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: salePrice == freezed
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      summaryDate: summaryDate == freezed
          ? _value.summaryDate
          : summaryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      {bool active,
      String id,
      String name,
      int currentStock,
      double buyPrice,
      double salePrice,
      DateTime summaryDate});
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
    Object? currentStock = freezed,
    Object? buyPrice = freezed,
    Object? salePrice = freezed,
    Object? summaryDate = freezed,
  }) {
    return _then(_$_ProductSummary(
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentStock: currentStock == freezed
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
      buyPrice: buyPrice == freezed
          ? _value.buyPrice
          : buyPrice // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: salePrice == freezed
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      summaryDate: summaryDate == freezed
          ? _value.summaryDate
          : summaryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductSummary
    with DiagnosticableTreeMixin
    implements _ProductSummary {
  const _$_ProductSummary(
      {required this.active,
      required this.id,
      required this.name,
      required this.currentStock,
      required this.buyPrice,
      required this.salePrice,
      required this.summaryDate});

  factory _$_ProductSummary.fromJson(Map<String, dynamic> json) =>
      _$$_ProductSummaryFromJson(json);

  @override
  final bool active;
  @override
  final String id;
  @override
  final String name;
  @override
  final int currentStock;
  @override
  final double buyPrice;
  @override
  final double salePrice;
  @override
  final DateTime summaryDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductSummary(active: $active, id: $id, name: $name, currentStock: $currentStock, buyPrice: $buyPrice, salePrice: $salePrice, summaryDate: $summaryDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductSummary'))
      ..add(DiagnosticsProperty('active', active))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('currentStock', currentStock))
      ..add(DiagnosticsProperty('buyPrice', buyPrice))
      ..add(DiagnosticsProperty('salePrice', salePrice))
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
            const DeepCollectionEquality()
                .equals(other.currentStock, currentStock) &&
            const DeepCollectionEquality().equals(other.buyPrice, buyPrice) &&
            const DeepCollectionEquality().equals(other.salePrice, salePrice) &&
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
      const DeepCollectionEquality().hash(currentStock),
      const DeepCollectionEquality().hash(buyPrice),
      const DeepCollectionEquality().hash(salePrice),
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
      {required final bool active,
      required final String id,
      required final String name,
      required final int currentStock,
      required final double buyPrice,
      required final double salePrice,
      required final DateTime summaryDate}) = _$_ProductSummary;

  factory _ProductSummary.fromJson(Map<String, dynamic> json) =
      _$_ProductSummary.fromJson;

  @override
  bool get active => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get currentStock => throw _privateConstructorUsedError;
  @override
  double get buyPrice => throw _privateConstructorUsedError;
  @override
  double get salePrice => throw _privateConstructorUsedError;
  @override
  DateTime get summaryDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductSummaryCopyWith<_$_ProductSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  bool get isIncoming => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  int get totalSelectedQuantity => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<ProductSummary> get productsSummary =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res>;
  $Res call(
      {bool isIncoming,
      double totalAmount,
      int totalQuantity,
      int totalSelectedQuantity,
      DateTime createdAt,
      List<ProductSummary> productsSummary});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  final Transaction _value;
  // ignore: unused_field
  final $Res Function(Transaction) _then;

  @override
  $Res call({
    Object? isIncoming = freezed,
    Object? totalAmount = freezed,
    Object? totalQuantity = freezed,
    Object? totalSelectedQuantity = freezed,
    Object? createdAt = freezed,
    Object? productsSummary = freezed,
  }) {
    return _then(_value.copyWith(
      isIncoming: isIncoming == freezed
          ? _value.isIncoming
          : isIncoming // ignore: cast_nullable_to_non_nullable
              as bool,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalSelectedQuantity: totalSelectedQuantity == freezed
          ? _value.totalSelectedQuantity
          : totalSelectedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productsSummary: productsSummary == freezed
          ? _value.productsSummary
          : productsSummary // ignore: cast_nullable_to_non_nullable
              as List<ProductSummary>,
    ));
  }
}

/// @nodoc
abstract class _$$_TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$_TransactionCopyWith(
          _$_Transaction value, $Res Function(_$_Transaction) then) =
      __$$_TransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isIncoming,
      double totalAmount,
      int totalQuantity,
      int totalSelectedQuantity,
      DateTime createdAt,
      List<ProductSummary> productsSummary});
}

/// @nodoc
class __$$_TransactionCopyWithImpl<$Res> extends _$TransactionCopyWithImpl<$Res>
    implements _$$_TransactionCopyWith<$Res> {
  __$$_TransactionCopyWithImpl(
      _$_Transaction _value, $Res Function(_$_Transaction) _then)
      : super(_value, (v) => _then(v as _$_Transaction));

  @override
  _$_Transaction get _value => super._value as _$_Transaction;

  @override
  $Res call({
    Object? isIncoming = freezed,
    Object? totalAmount = freezed,
    Object? totalQuantity = freezed,
    Object? totalSelectedQuantity = freezed,
    Object? createdAt = freezed,
    Object? productsSummary = freezed,
  }) {
    return _then(_$_Transaction(
      isIncoming: isIncoming == freezed
          ? _value.isIncoming
          : isIncoming // ignore: cast_nullable_to_non_nullable
              as bool,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalSelectedQuantity: totalSelectedQuantity == freezed
          ? _value.totalSelectedQuantity
          : totalSelectedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productsSummary: productsSummary == freezed
          ? _value._productsSummary
          : productsSummary // ignore: cast_nullable_to_non_nullable
              as List<ProductSummary>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Transaction with DiagnosticableTreeMixin implements _Transaction {
  const _$_Transaction(
      {required this.isIncoming,
      required this.totalAmount,
      required this.totalQuantity,
      required this.totalSelectedQuantity,
      required this.createdAt,
      required final List<ProductSummary> productsSummary})
      : _productsSummary = productsSummary;

  factory _$_Transaction.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionFromJson(json);

  @override
  final bool isIncoming;
  @override
  final double totalAmount;
  @override
  final int totalQuantity;
  @override
  final int totalSelectedQuantity;
  @override
  final DateTime createdAt;
  final List<ProductSummary> _productsSummary;
  @override
  List<ProductSummary> get productsSummary {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsSummary);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Transaction(isIncoming: $isIncoming, totalAmount: $totalAmount, totalQuantity: $totalQuantity, totalSelectedQuantity: $totalSelectedQuantity, createdAt: $createdAt, productsSummary: $productsSummary)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Transaction'))
      ..add(DiagnosticsProperty('isIncoming', isIncoming))
      ..add(DiagnosticsProperty('totalAmount', totalAmount))
      ..add(DiagnosticsProperty('totalQuantity', totalQuantity))
      ..add(DiagnosticsProperty('totalSelectedQuantity', totalSelectedQuantity))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('productsSummary', productsSummary));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Transaction &&
            const DeepCollectionEquality()
                .equals(other.isIncoming, isIncoming) &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality()
                .equals(other.totalQuantity, totalQuantity) &&
            const DeepCollectionEquality()
                .equals(other.totalSelectedQuantity, totalSelectedQuantity) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other._productsSummary, _productsSummary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isIncoming),
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(totalQuantity),
      const DeepCollectionEquality().hash(totalSelectedQuantity),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(_productsSummary));

  @JsonKey(ignore: true)
  @override
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      __$$_TransactionCopyWithImpl<_$_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionToJson(this);
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {required final bool isIncoming,
      required final double totalAmount,
      required final int totalQuantity,
      required final int totalSelectedQuantity,
      required final DateTime createdAt,
      required final List<ProductSummary> productsSummary}) = _$_Transaction;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$_Transaction.fromJson;

  @override
  bool get isIncoming => throw _privateConstructorUsedError;
  @override
  double get totalAmount => throw _privateConstructorUsedError;
  @override
  int get totalQuantity => throw _privateConstructorUsedError;
  @override
  int get totalSelectedQuantity => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  List<ProductSummary> get productsSummary =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
