import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_keeper/src/products/product.dart';

/// Service to provide access to product api
class ProductService {
  /// Produc API url
  final String uri = 'http://192.168.0.7:3000/api';

  /// Get All Products from Server
  Future<List<Product>> getProducts() async {
    try {
      final res = await http.get(Uri.parse(uri));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as List<String>;
        final products = body.map(Product.fromJson).toList();
        return products;
      }
      return [];
    } catch (e) {
      final error = ArgumentError(e);
      throw error;
    }
  }
}
