// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);
import 'dart:convert';

/// Product Model
class Product {
  /// Product Constructor
  Product({
    this.id,
    this.description,
    required this.name,
    required this.unit,
    this.pricePerUnit = 0.0,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  /// Convert Json String to Product
  factory Product.fromJson(String str) =>
      Product.fromMap(json.decode(str) as Map<String, dynamic>);

  /// Convert Map<String, dynamic> to Product
  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json['id'] == null ? null : json['id'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        createdAt:
            json['createdAt'] == null ? null : json['createdAt'] as DateTime,
        updatedAt:
            json['updatedAt'] == null ? null : json['updatedAt'] as DateTime,
        name: json['name'] as String,
        unit: json['unit'] as String,
        pricePerUnit: (json['pricePerUnit'] as num).toDouble(),
        type: Type.fromMap(json['type'] as Map<String, dynamic>),
      );

  /// Convert To Map
  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'description': description,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'name': name,
        'unit': unit,
        'pricePerUnit': pricePerUnit,
        'type': type?.toMap(),
      };

  /// Unique id of the product
  String? id;

  ///A detailed product description (Optional)
  String? description;

  /// A product’s name
  String name;

  /// The basic unit used to measure a product, e.g. pieces, kilograms, pounds
  String unit;

  /// The price per basic unit
  double pricePerUnit;

  /// Date time product created
  DateTime? createdAt;

  /// Date time product updated
  DateTime? updatedAt;

  /// Type or Category of a product
  Type? type;

  /// returns new Product with your desired properties.
  Product copyWith({
    String? id,
    String? description,
    required String name,
    required String unit,
    required double pricePerUnit,
    DateTime? createdAt,
    DateTime? updatedAt,
    Type? type,
  }) =>
      Product(
        id: id ?? this.id,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name,
        unit: unit,
        pricePerUnit: pricePerUnit,
        type: type ?? this.type,
      );

  /// Convert to Json String
  String toJson() => json.encode(toMap());
}

///  store different products categories
class Type {
  /// Type Constructor
  Type({
    required this.id,
    required this.name,
  });

  /// Convert String  to Map<String dynamic>
  factory Type.fromJson(String str) =>
      Type.fromMap(json.decode(str) as Map<String, dynamic>);

  ///
  factory Type.fromMap(Map<String, dynamic> json) => Type(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  /// unique id for type
  int id;

  /// Type name for product
  String name;

  /// returns new Type with your desired properties.
  Type copyWith({
    required int id,
    required String name,
  }) =>
      Type(
        id: id,
        name: name,
      );

  ///
  String toJson() => json.encode(toMap());

  ///  Convert to Map<String dynamic>
  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
      };
}
