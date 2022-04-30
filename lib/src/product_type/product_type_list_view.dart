import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_type_controller.dart';
import 'package:inventory_keeper/src/models/product_type.dart';
import 'package:inventory_keeper/src/widgets/custom_form_field.dart';
import 'package:provider/provider.dart';

///
class ProductTypeListView extends StatelessWidget {
  ///
  const ProductTypeListView({Key? key}) : super(key: key);

  /// Product details route name
  static const routeName = '/productTypeListView';
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductTypeController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Product Types')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: CustomFormField(
                    keyboardType: TextInputType.text,
                    controller: controller.nameController,
                    label: 'Product Type',
                    hint: '',
                    validator: (value) {
                      if (value == null) {
                        return 'Please provide product type';
                      }
                      return null;
                    },
                    inputAction: TextInputAction.done,
                    focusNode: controller.nameFocusNode,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                // we need add button at last friends row
                ElevatedButton(
                  onPressed: controller.addProductType,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<ProductType>>(
              stream: controller.fetchProductTypesAsStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  final data = snapshot.data;

                  controller.productTypes = data!;

                  return ListView.builder(
                    restorationId: 'productTypeListView',
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = data[index];
                      return ListTile(
                        title: Text(item.name),
                        trailing: TextButton(
                          onPressed: () => controller.removeProductType(item),
                          child: const Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        onTap: () {
                          // Navigator.restorablePushNamed(
                          //   context,
                          //   ProductDetailsView.routeName,
                          // );
                        },
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No Data'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
