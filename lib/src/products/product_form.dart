import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
import 'package:inventory_keeper/src/product_type/product_types_selector.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/custom_form_field.dart';

///
class ProductForm extends StatelessWidget {
  ///
  const ProductForm({
    Key? key,
    required this.formKey,
    this.product,
    required this.nameController,
    required this.salePriceController,
    required this.buyPriceController,
    required this.unitController,
  }) : super(key: key);

  ///
  final GlobalKey<FormState> formKey;

  ///
  final Product? product;

  /// Form Controller
  final TextEditingController nameController,
      salePriceController,
      buyPriceController,
      unitController;
  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    if (product != null) {
      nameController.text = product!.name;
      salePriceController.text = '${product!.salePrice ?? ''}';
      buyPriceController.text = '${product!.buyPrice ?? ''}';
      unitController.text = product!.unit ?? '';
    } else {
      nameController.text = '';
      salePriceController.text = '';
      buyPriceController.text = '';
      unitController.text = '';
    }

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            CustomFormField(
              keyboardType: TextInputType.text,
              controller: nameController,
              label: 'Item Name *',
              validator: (value) {
                if (value == null || value == '') {
                  return 'Please provide item name';
                }
                return null;
              },
              inputAction: TextInputAction.next,
              focusNode: productController.nameFocusNode,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(9),
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d+\.?\d{0,2}'),
                )
              ],
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              controller: buyPriceController,
              label: 'Cost',
              suffixText: 'TSh',
              helperText: 'Buying price',
              inputAction: TextInputAction.next,
              focusNode: productController.buyPriceFocusNode,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(9),
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d+\.?\d{0,2}'),
                )
              ],
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              controller: salePriceController,
              label: 'Price',
              helperText: 'Selling price',
              suffixText: 'TSh',
              inputAction: TextInputAction.next,
              focusNode: productController.salePriceFocusNode,
            ),
            const SizedBox(height: 16),
            CustomFormField(
              keyboardType: TextInputType.text,
              controller: unitController,
              label: 'Unit Of Measure',
              inputAction: TextInputAction.next,
              focusNode: productController.unitFocusNode,
            ),
            const Divider(),
            GetBuilder<ProductController>(
              builder: (cont) {
                return ListTile(
                  onTap: () {
                    displayDialog<int>(
                      context,
                      StockQuantityField(
                        transactionType: TransactionType.all,
                        productName: product?.name,
                        title: 'Safety Stock',
                        counter: product?.safetyStock ?? 0,
                      ),
                    ).then((value) {
                      if (value != null && value > 0) {
                        productController.safetyQuantity = value;
                      }
                    });
                  },
                  dense: true,
                  title: const Text(
                    'Safety Stock',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: Text('${productController.safetyQuantity ?? 0}'),
                );
              },
            ),
            const SizedBox(height: 16),
            const ProductTypesSelector(),
            const SizedBox(height: 16),
            // Expanded(child: Container()),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
