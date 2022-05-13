import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product.dart';

void main() {
  test("Area of the circle with radius 1 should be 3.141592", () {
    // Arrange
    final productController = ProductController();
    // Act
    productController.product = Product(name: 'Pepsi');

    // Assert
    expect(productController.product?.name, 'Pepsi');
  });
}
