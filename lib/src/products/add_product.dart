import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/product_type/product_types_selector.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/custom_form_field.dart';
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
      titleText = 'Add Product';
    } else {
      titleText = 'Edit Product';
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.nameController,
                  label: 'Item Name *',
                  hint: '',
                  validator: (value) {
                    if (value == null || value == '') {
                      return 'Please provide item name';
                    }
                    return null;
                  },
                  inputAction: TextInputAction.next,
                  focusNode: controller.nameFocusNode,
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
                  controller: controller.buyPriceController,
                  label: 'Cost',
                  hint: '',
                  inputAction: TextInputAction.next,
                  focusNode: controller.buyPriceFocusNode,
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
                  controller: controller.salePriceController,
                  label: 'Price',
                  hint: '',
                  inputAction: TextInputAction.next,
                  focusNode: controller.salePriceFocusNode,
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.unitController,
                  label: 'Unit Of Measure',
                  hint: '',
                  inputAction: TextInputAction.next,
                  focusNode: controller.unitFocusNode,
                ),
                const SizedBox(height: 16),
                const ProductTypesSelector(),
                const SizedBox(height: 16),
                if (controller.hasErrorMessage)
                  Text(
                    controller.errorMessage!,
                    style: TextStyle(
                      color: Colors.red[800],
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                else
                  Container(),
                // Expanded(child: Container()),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
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
                controller.updateProduct();
              } else {
                controller.addProduct();
                loadDialog<dynamic>(context, loadingText: 'Saving item');
              }
            }
          },
          child: const Text('Save'),
        ),
      ),
    );
  }
}
