import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/products/product_form.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:provider/provider.dart';

/// Add Product Page
class AddProduct extends StatelessWidget {
  ///
  const AddProduct({Key? key}) : super(key: key);

  /// Add Product route name
  static const routeName = '/addProduct';

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final controller = context.watch<ProductController>();
    var titleText = '';
    if (controller.product == null) {
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
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
        child: ProductForm(formKey: _formKey),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 14,
              right: 24,
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (controller.product?.id != null) {
                loadDialog<dynamic>(context, loadingText: 'Updating item');
                controller.updateProduct(andGoBack: true);
              } else {
                displayDialog(
                  context,
                  StockQuantityField(
                    controller: controller,
                    title: 'Input stock quantity',
                    initialValue: 0,
                  ),
                ).then((value) {
                  controller.addProduct();
                  loadDialog<dynamic>(context, loadingText: 'Saving item');
                });
              }
            }
          },
          child: const Text('Save'),
        ),
      ),
    );
  }
}
