import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
import 'package:inventory_keeper/src/products/product_form.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/app_constants.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

///
enum AddProductEnum {
  ///
  edit,

  ///
  add,
}

/// Add Product Page
class AddProduct extends StatelessWidget {
  ///
  const AddProduct({Key? key, required this.addProductEnum, this.product})
      : super(key: key);

  /// Add Product route name
  static const routeName = '/addProduct';

  /// Add Product Enum
  final AddProductEnum addProductEnum;

  /// Product Definition
  final Product? product;

  ///Form Controller
  static TextEditingController nameController = TextEditingController(),
      salePriceController = TextEditingController(),
      buyPriceController = TextEditingController(),
      unitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    userId: firebaseAuth.currentUser!.uid,
                    id: product?.id,
                    lastUpdatedAt: DateTime.now().millisecondsSinceEpoch,
                    name: nameController.text,
                    unit: unitController.text,
                    salePrice: double.tryParse(salePriceController.text) ?? 0,
                    buyPrice: double.tryParse(buyPriceController.text) ?? 0,
                  );
                  if (addProductEnum == AddProductEnum.edit) {
                    controller.updateProduct(newProduct);
                  } else {
                    displayDialog<Map<String, int?>>(
                      context,
                      StockQuantityField(
                        transactionType: TransactionType.all,
                        currentStock: product?.currentStock ?? 0,
                        productName: product?.name,
                        title: 'Input stock quantity',
                      ),
                    ).then((map) {
                      final value = map?['quantity'];
                      if (value != null && value > 0) {
                        controller.currentStockQuantity = value;
                      }
                      controller.addProduct(newProduct);
                    });
                  }
                }
              },
              child: Text(
                addProductEnum == AddProductEnum.add ? 'Save' : 'Update',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
