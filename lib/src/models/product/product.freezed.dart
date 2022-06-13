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
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  double get salePrice => throw _privateConstructorUsedError;
  double get buyPrice => throw _privateConstructorUsedError;
  int get currentStock => throw _privateConstructorUsedError;
  int get safetyQuantity => throw _privateConstructorUsedError;
  ProductCategory? get category => throw _privateConstructorUsedError;
  int? get expireDate => throw _privateConstructorUsedError;
  int get lastUpdatedAt => throw _privateConstructorUsedError;

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
      String userId,
      String name,
      String? image,
      bool? active,
      String? description,
      String? unit,
      double salePrice,
      double buyPrice,
      int currentStock,
      int safetyQuantity,
      ProductCategory? category,
      int? expireDate,
      int lastUpdatedAt});

  $ProductCategoryCopyWith<$Res>? get category;
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
    Object? userId = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? active = freezed,
    Object? description = freezed,
    Object? unit = freezed,
    Object? salePrice = freezed,
    Object? buyPrice = freezed,
    Object? currentStock = freezed,
    Object? safetyQuantity = freezed,
    Object? category = freezed,
    Object? expireDate = freezed,
    Object? lastUpdatedAt = freezed,
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
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as double,
      buyPrice: buyPrice == freezed
          ? _value.buyPrice
          : buyPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currentStock: currentStock == freezed
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
      safetyQuantity: safetyQuantity == freezed
          ? _value.safetyQuantity
          : safetyQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      expireDate: expireDate == freezed
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $ProductCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $ProductCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value));
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
      String userId,
      String name,
      String? image,
      bool? active,
      String? description,
      String? unit,
      double salePrice,
      double buyPrice,
      int currentStock,
      int safetyQuantity,
      ProductCategory? category,
      int? expireDate,
      int lastUpdatedAt});

  @override
  $ProductCategoryCopyWith<$Res>? get category;
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
    Object? userId = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? active = freezed,
    Object? description = freezed,
    Object? unit = freezed,
    Object? salePrice = freezed,
    Object? buyPrice = freezed,
    Object? currentStock = freezed,
    Object? safetyQuantity = freezed,
    Object? category = freezed,
    Object? expireDate = freezed,
    Object? lastUpdatedAt = freezed,
  }) {
    return _then(_$_Product(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as double,
      buyPrice: buyPrice == freezed
          ? _value.buyPrice
          : buyPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currentStock: currentStock == freezed
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
      safetyQuantity: safetyQuantity == freezed
          ? _value.safetyQuantity
          : safetyQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      expireDate: expireDate == freezed
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product with DiagnosticableTreeMixin implements _Product {
  const _$_Product(
      {this.id,
      required this.userId,
      required this.name,
      this.image,
      this.active,
      this.description,
      this.unit,
      this.salePrice = 0,
      this.buyPrice = 0,
      this.currentStock = 0,
      this.safetyQuantity = 0,
      this.category,
      this.expireDate,
      required this.lastUpdatedAt});

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final String? id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final String? image;
  @override
  final bool? active;
  @override
  final String? description;
  @override
  final String? unit;
  @override
  @JsonKey()
  final double salePrice;
  @override
  @JsonKey()
  final double buyPrice;
  @override
  @JsonKey()
  final int currentStock;
  @override
  @JsonKey()
  final int safetyQuantity;
  @override
  final ProductCategory? category;
  @override
  final int? expireDate;
  @override
  final int lastUpdatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Product(id: $id, userId: $userId, name: $name, image: $image, active: $active, description: $description, unit: $unit, salePrice: $salePrice, buyPrice: $buyPrice, currentStock: $currentStock, safetyQuantity: $safetyQuantity, category: $category, expireDate: $expireDate, lastUpdatedAt: $lastUpdatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Product'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('active', active))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('unit', unit))
      ..add(DiagnosticsProperty('salePrice', salePrice))
      ..add(DiagnosticsProperty('buyPrice', buyPrice))
      ..add(DiagnosticsProperty('currentStock', currentStock))
      ..add(DiagnosticsProperty('safetyQuantity', safetyQuantity))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('expireDate', expireDate))
      ..add(DiagnosticsProperty('lastUpdatedAt', lastUpdatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality().equals(other.salePrice, salePrice) &&
            const DeepCollectionEquality().equals(other.buyPrice, buyPrice) &&
            const DeepCollectionEquality()
                .equals(other.currentStock, currentStock) &&
            const DeepCollectionEquality()
                .equals(other.safetyQuantity, safetyQuantity) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.expireDate, expireDate) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdatedAt, lastUpdatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(active),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(salePrice),
      const DeepCollectionEquality().hash(buyPrice),
      const DeepCollectionEquality().hash(currentStock),
      const DeepCollectionEquality().hash(safetyQuantity),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(expireDate),
      const DeepCollectionEquality().hash(lastUpdatedAt));

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
      required final String userId,
      required final String name,
      final String? image,
      final bool? active,
      final String? description,
      final String? unit,
      final double salePrice,
      final double buyPrice,
      final int currentStock,
      final int safetyQuantity,
      final ProductCategory? category,
      final int? expireDate,
      required final int lastUpdatedAt}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  bool? get active => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get unit => throw _privateConstructorUsedError;
  @override
  double get salePrice => throw _privateConstructorUsedError;
  @override
  double get buyPrice => throw _privateConstructorUsedError;
  @override
  int get currentStock => throw _privateConstructorUsedError;
  @override
  int get safetyQuantity => throw _privateConstructorUsedError;
  @override
  ProductCategory? get category => throw _privateConstructorUsedError;
  @override
  int? get expireDate => throw _privateConstructorUsedError;
  @override
  int get lastUpdatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
