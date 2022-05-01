import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_type_controller.dart';
import 'package:inventory_keeper/src/models/product_type.dart';
import 'package:inventory_keeper/src/product_type/product_type_list_view.dart';
import 'package:inventory_keeper/src/product_type/product_types_selector.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        actions: [
          if (controller.busy)
            const Center(child: CircularProgressIndicator())
          else
            Container(),
          if (controller.product == null)
            Container()
          else
            Padding(
              padding: const EdgeInsets.all(8),
              child: controller.busy
                  ? Container()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: controller.removeProduct,
                      child: const Text('Delete'),
                    ),
            ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: controller.busy
                ? Container()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (controller.product!.id != null) {
                          controller.updateProduct();
                        } else {
                          controller.addProduct();
                        }
                      }
                    },
                    child: const Text('Save'),
                  ),
          )
        ],
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
                  label: 'Product Name *',
                  hint: '',
                  validator: (value) {
                    if (value == null || value == '') {
                      return 'Please provide product name';
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
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  controller: controller.priceController,
                  label: 'Price *',
                  hint: '',
                  validator: (value) {
                    if (value == null || value == '') {
                      return 'Please provide product price';
                    }
                    return null;
                  },
                  inputAction: TextInputAction.next,
                  focusNode: controller.priceFocusNode,
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.unitController,
                  label: 'Unit *',
                  hint: 'Crate/ Kg/ ...',
                  validator: (value) {
                    if (value == null || value == '') {
                      return 'Please provide product unit';
                    }
                    return null;
                  },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
