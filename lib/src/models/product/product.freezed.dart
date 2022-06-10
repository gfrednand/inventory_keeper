// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String? get id => throw _privateConstructorUsedError;

  /// This is the name of the product.
  ///
  /// It's required must not be null.
  String get name => throw _privateConstructorUsedError;
  int get currentStock => throw _privateConstructorUsedError;
  int? get selectedQuantity => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  double? get salePrice => throw _privateConstructorUsedError;
  double? get buyPrice => throw _privateConstructorUsedError;
  int get safetyStock => throw _privateConstructorUsedError;
  bool? get isIncomingStock => throw _privateConstructorUsedError;
  ProductType? get type => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  DateTime? get expireDate => throw _privateConstructorUsedError;
  int get lastUpdatedAt => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      int currentStock,
      int? selectedQuantity,
      bool? active,
      String? description,
      String? unit,
      double? salePrice,
      double? buyPrice,
      int safetyStock,
      bool? isIncomingStock,
      ProductType? type,
      @ServerTimestampConverter() DateTime? createdAt,
      @ServerTimestampConverter() DateTime? expireDate,
      int lastUpdatedAt,
      String userId});

  $ProductTypeCopyWith<$Res>? get type;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? currentStock = freezed,
    Object? selectedQuantity = freezed,
    Object? active = freezed,
    Object? description = freezed,
    Object? unit = freezed,
    Object? salePrice = freezed,
    Object? buyPrice = freezed,
    Object? safetyStock = freezed,
    Object? isIncomingStock = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? expireDate = freezed,
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
      currentStock: currentStock == freezed
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
      selectedQuantity: selectedQuantity == freezed
          ? _value.selectedQuantity
          : selectedQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      salePrice: salePrice == freezed
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      buyPrice: buyPrice == freezed
          ? _value.buyPrice
          : buyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      safetyStock: safetyStock == freezed
          ? _value.safetyStock
          : safetyStock // ignore: cast_nullable_to_non_nullable
              as int,
      isIncomingStock: isIncomingStock == freezed
          ? _value.isIncomingStock
          : isIncomingStock // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductType?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expireDate: expireDate == freezed
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

  @override
  $ProductTypeCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $ProductTypeCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value));
    });
  }
}

/// @nodoc
abstract class _$$_ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$_ProductCopyWith(
          _$_Product value, $Res Function(_$_Product) then) =
      __$$_ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      int currentStock,
      int? selectedQuantity,
      bool? active,
      String? description,
      String? unit,
      double? salePrice,
      double? buyPrice,
      int safetyStock,
      bool? isIncomingStock,
      ProductType? type,
      @ServerTimestampConverter() DateTime? createdAt,
      @ServerTimestampConverter() DateTime? expireDate,
      int lastUpdatedAt,
      String userId});

  @override
  $ProductTypeCopyWith<$Res>? get type;
}

/// @nodoc
class __$$_ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$$_ProductCopyWith<$Res> {
  __$$_ProductCopyWithImpl(_$_Product _value, $Res Function(_$_Product) _then)
      : super(_value, (v) => _then(v as _$_Product));

  @override
  _$_Product get _value => super._value as _$_Product;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? currentStock = freezed,
    Object? selectedQuantity = freezed,
    Object? active = freezed,
    Object? description = freezed,
    Object? unit = freezed,
    Object? salePrice = freezed,
    Object? buyPrice = freezed,
    Object? safetyStock = freezed,
    Object? isIncomingStock = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? expireDate = freezed,
    Object? lastUpdatedAt = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_Product(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentStock: currentStock == freezed
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
      selectedQuantity: selectedQuantity == freezed
          ? _value.selectedQuantity
          : selectedQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      salePrice: salePrice == freezed
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      buyPrice: buyPrice == freezed
          ? _value.buyPrice
          : buyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      safetyStock: safetyStock == freezed
          ? _value.safetyStock
          : safetyStock // ignore: cast_nullable_to_non_nullable
              as int,
      isIncomingStock: isIncomingStock == freezed
          ? _value.isIncomingStock
          : isIncomingStock // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductType?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expireDate: expireDate == freezed
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$_Product with DiagnosticableTreeMixin implements _Product {
  const _$_Product(
      {this.id,
      required this.name,
      this.currentStock = 0,
      this.selectedQuantity,
      this.active,
      this.description,
      this.unit,
      this.salePrice,
      this.buyPrice,
      this.safetyStock = 0,
      this.isIncomingStock,
      this.type,
      @ServerTimestampConverter() this.createdAt,
      @ServerTimestampConverter() this.expireDate,
      required this.lastUpdatedAt,
      required this.userId});

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final String? id;

  /// This is the name of the product.
  ///
  /// It's required must not be null.
  @override
  final String name;
  @override
  @JsonKey()
  final int currentStock;
  @override
  final int? selectedQuantity;
  @override
  final bool? active;
  @override
  final String? description;
  @override
  final String? unit;
  @override
  final double? salePrice;
  @override
  final double? buyPrice;
  @override
  @JsonKey()
  final int safetyStock;
  @override
  final bool? isIncomingStock;
  @override
  final ProductType? type;
  @override
  @ServerTimestampConverter()
  final DateTime? createdAt;
  @override
  @ServerTimestampConverter()
  final DateTime? expireDate;
  @override
  final int lastUpdatedAt;
  @override
  final String userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Product(id: $id, name: $name, currentStock: $currentStock, selectedQuantity: $selectedQuantity, active: $active, description: $description, unit: $unit, salePrice: $salePrice, buyPrice: $buyPrice, safetyStock: $safetyStock, isIncomingStock: $isIncomingStock, type: $type, createdAt: $createdAt, expireDate: $expireDate, lastUpdatedAt: $lastUpdatedAt, userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Product'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('currentStock', currentStock))
      ..add(DiagnosticsProperty('selectedQuantity', selectedQuantity))
      ..add(DiagnosticsProperty('active', active))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('unit', unit))
      ..add(DiagnosticsProperty('salePrice', salePrice))
      ..add(DiagnosticsProperty('buyPrice', buyPrice))
      ..add(DiagnosticsProperty('safetyStock', safetyStock))
      ..add(DiagnosticsProperty('isIncomingStock', isIncomingStock))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('expireDate', expireDate))
      ..add(DiagnosticsProperty('lastUpdatedAt', lastUpdatedAt))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.currentStock, currentStock) &&
            const DeepCollectionEquality()
                .equals(other.selectedQuantity, selectedQuantity) &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality().equals(other.salePrice, salePrice) &&
            const DeepCollectionEquality().equals(other.buyPrice, buyPrice) &&
            const DeepCollectionEquality()
                .equals(other.safetyStock, safetyStock) &&
            const DeepCollectionEquality()
                .equals(other.isIncomingStock, isIncomingStock) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.expireDate, expireDate) &&
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
      const DeepCollectionEquality().hash(currentStock),
      const DeepCollectionEquality().hash(selectedQuantity),
      const DeepCollectionEquality().hash(active),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(salePrice),
      const DeepCollectionEquality().hash(buyPrice),
      const DeepCollectionEquality().hash(safetyStock),
      const DeepCollectionEquality().hash(isIncomingStock),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(expireDate),
      const DeepCollectionEquality().hash(lastUpdatedAt),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      __$$_ProductCopyWithImpl<_$_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(this);
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {final String? id,
      required final String name,
      final int currentStock,
      final int? selectedQuantity,
      final bool? active,
      final String? description,
      final String? unit,
      final double? salePrice,
      final double? buyPrice,
      final int safetyStock,
      final bool? isIncomingStock,
      final ProductType? type,
      @ServerTimestampConverter() final DateTime? createdAt,
      @ServerTimestampConverter() final DateTime? expireDate,
      required final int lastUpdatedAt,
      required final String userId}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override

  /// This is the name of the product.
  ///
  /// It's required must not be null.
  String get name => throw _privateConstructorUsedError;
  @override
  int get currentStock => throw _privateConstructorUsedError;
  @override
  int? get selectedQuantity => throw _privateConstructorUsedError;
  @override
  bool? get active => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get unit => throw _privateConstructorUsedError;
  @override
  double? get salePrice => throw _privateConstructorUsedError;
  @override
  double? get buyPrice => throw _privateConstructorUsedError;
  @override
  int get safetyStock => throw _privateConstructorUsedError;
  @override
  bool? get isIncomingStock => throw _privateConstructorUsedError;
  @override
  ProductType? get type => throw _privateConstructorUsedError;
  @override
  @ServerTimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @ServerTimestampConverter()
  DateTime? get expireDate => throw _privateConstructorUsedError;
  @override
  int get lastUpdatedAt => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
