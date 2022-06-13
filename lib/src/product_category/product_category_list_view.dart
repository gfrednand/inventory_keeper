import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_category_controller.dart';
import 'package:inventory_keeper/src/widgets/custom_form_field.dart';

///
class ProductCategoryListView extends StatelessWidget {
  ///
  const ProductCategoryListView({Key? key}) : super(key: key);

  /// Product details route name
  static const routeName = '/productCategoryListView';
  @override
  Widget build(BuildContext context) {
    final productCategoryController = Get.find<ProductCategoryController>();
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
        title: const Text('Categories'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Hero(
                    tag: 'hero-category-title',
                    child: Material(
                      child: CustomFormField(
                        keyboardType: TextInputType.text,
                        controller: productCategoryController.nameController,
                        label: 'Product Type',
                        validator: (value) {
                          if (value == null) {
                            return 'Please provide product type';
                          }
                          return null;
                        },
                        inputAction: TextInputAction.done,
                        focusNode: productCategoryController.nameFocusNode,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                // we need add button at last friends row
                ElevatedButton(
                  onPressed: productCategoryController.addProductCategory,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () {
                final data = productCategoryController.productCategories;
                if (data.isEmpty) {
                  return const Center(
                    child: Text('Nothing here'),
                  );
                }
                return ListView.builder(
                  restorationId: 'productTypeListView',
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = data[index];
                    return ListTile(
                      title: Text(item.name),
                      trailing: TextButton(
                        onPressed: () => productCategoryController
                            .removeProductCategory(item),
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      onTap: () {
                        productCategoryController.changeType(item);
                        Get.back<void>();
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
