import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/products/product_form.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

/// Add Product Page
class AddProduct extends StatelessWidget {
  ///
  const AddProduct({Key? key}) : super(key: key);

  /// Add Product route name
  static const routeName = '/addProduct';

  ///Form Controller
  static TextEditingController nameController = TextEditingController(),
      salePriceController = TextEditingController(),
      buyPriceController = TextEditingController(),
      unitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as Product?;

    final _formKey = GlobalKey<FormState>();

    final controller = Get.find<ProductController>();
    var titleText = '';
    if (product == null) {
      titleText = 'Add Item';
    } else {
      titleText = 'Edit Item';
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(titleText),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
              child: ProductForm(
                nameController: nameController,
                salePriceController: salePriceController,
                buyPriceController: buyPriceController,
                unitController: unitController,
                formKey: _formKey,
                product: product,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.blue700,
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                  left: 14,
                  right: 24,
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newProduct = Product(
                    id: product?.id,
                    name: nameController.text,
                    unit: unitController.text,
                    salePrice: double.tryParse(salePriceController.text) ?? 0,
                    buyPrice: double.tryParse(buyPriceController.text) ?? 0,
                  );
                  if (newProduct.id != null) {
                    loadDialog<dynamic>(context, loadingText: 'Updating item');
                    controller.updateProduct(newProduct).then((product) {
                      Get.back<void>();
                      // ignore: cascade_invocations
                      Get.back<void>();
                      // ignore: cascade_invocations
                      Get.snackbar('Product', 'Updated Successful');
                      // ignore: cascade_invocations
                    });
                  } else {
                    displayDialog<int>(
                      context,
                      StockQuantityField(
                        currentStock: product?.currentStock ?? 0,
                        productName: product?.name,
                        title: 'Input stock quantity',
                      ),
                    ).then((value) {
                      if (value != null && value > 0) {
                        controller.currentStockQuantity = value;
                      }
                      loadDialog<dynamic>(context, loadingText: 'Saving item');
                      controller.addProduct(newProduct).then((value) {
                        Get.back<void>();
                        // ignore: cascade_invocations
                        Get.back<void>();
                        // ignore: cascade_invocations
                        Get.snackbar('Product', 'Added Successful');
                      });
                    });
                  }
                }
              },
              child: Text(product?.id == null ? 'Save' : 'Update'),
            ),
          ),
        ],
      ),
    );
  }
}
