import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/product_type/product_types_selector.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/custom_form_field.dart';
import 'package:provider/provider.dart';

///
class ProductForm extends StatelessWidget {
  ///
  const ProductForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  ///
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();
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
            const Divider(),
            ListTile(
              onTap: () {
                displayDialog(
                  context,
                  StockQuantityField(
                    isSafetyQuantity: true,
                    controller: controller,
                    title: 'Safety Stock',
                    initialValue: controller.product?.safetyStock ?? 0,
                  ),
                );
              },
              dense: true,
              title: const Text(
                'Safety Stock',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Text('${controller.product?.safetyStock ?? '-'}'),
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
    );
  }
}
