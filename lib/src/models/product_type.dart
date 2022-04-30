import 'dart:convert';

///  store different products categories
class ProductType {
  /// ProductType Constructor
  ProductType({
    required this.id,
    required this.name,
  });

  /// Convert String  to Map<String dynamic>
  factory ProductType.fromJson(String str) =>
      ProductType.fromMap(json.decode(str) as Map<String, dynamic>);

  ///
  factory ProductType.fromMap(Map<String, dynamic> json) => ProductType(
        id: json['id'] as String,
        name: json['name'] as String,
      );

  /// unique id for ProductType
  String id;

  /// ProductType name for product
  String name;

  /// returns new ProductType with your desired properties.
  ProductType copyWith({
    required String id,
    required String name,
  }) =>
      ProductType(
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
