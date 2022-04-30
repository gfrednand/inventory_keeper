import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_type_controller.dart';
import 'package:inventory_keeper/src/models/product_type.dart';
import 'package:inventory_keeper/src/product_type/product_type_list_view.dart';
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
    final productTypeController = context.watch<ProductTypeController>();
    final _formKey = GlobalKey<FormState>();
    final controller = context.watch<ProductController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
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
                    if (value == null) {
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
                    if (value == null) {
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
                    if (value == null) {
                      return 'Please provide product unit';
                    }
                    return null;
                  },
                  inputAction: TextInputAction.next,
                  focusNode: controller.unitFocusNode,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      top: 10,
                      bottom: 16,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ProductTypeListView.routeName,
                        );
                      },
                      child: const Text(
                        'Product Types',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: StreamBuilder(
                    stream: productTypeController.fetchProductTypesAsStream(),
                    builder:
                        (context, AsyncSnapshot<List<ProductType>> snapshot) {
                      List<ProductType>? data = [];
                      if (snapshot.hasData) {
                        data = snapshot.data;
                        return ListView.separated(
                          itemCount: data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            final type = data![index];
                            return GestureDetector(
                              onTap: () {
                                productTypeController.selectedType = type;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: productTypeController
                                              .selectedType?.id ==
                                          type.id
                                      ? const Color.fromARGB(170, 144, 202, 249)
                                      : const Color.fromARGB(84, 158, 158, 158),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    data[index].name,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            width: 8,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                // DropdownButtonFormField<ProductType>(
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'Product Type',
                //   ),
                //   items: controller.types.map((v) {
                //     return DropdownMenuItem<ProductType>(
                //       value: v,
                //       child: Text(v.name),
                //     );
                //   }).toList(),
                //   validator: (value) {
                //     if (value == null) {
                //       return 'Please select a product type';
                //     }
                //     return null;
                //   },
                //   value: controller.type,
                //   onChanged: (type) => controller.type = type!,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
