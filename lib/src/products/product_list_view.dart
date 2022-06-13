import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_category_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
import 'package:inventory_keeper/src/products/product_search_delegate.dart';
import 'package:inventory_keeper/src/products/product_sort_container.dart';
import 'package:inventory_keeper/src/products/products_list.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/widgets/custom_appbar.dart';
import 'package:inventory_keeper/src/widgets/modal_sheet.dart';

/// Displays a list of Products.
class ProductListView extends StatelessWidget {
  ///
  const ProductListView({
    Key? key,
  }) : super(key: key);

  /// Product list route
  static const routeName = '/productListView';

  @override
  Widget build(BuildContext context) {
    final productCategoryController = ProductCategoryController.instance;
    final productController = Get.find<ProductController>();
    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          CustomAppBar(
            flexibleSpace: const FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(horizontal: 22),
              title: Text(
                'Items',
                style: TextStyle(color: Colors.black, fontSize: 28),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  showSearch<Product?>(
                    context: context,
                    delegate: ProductSearchDelegate(),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.sort, color: Colors.black),
                onPressed: () {
                  CustomModalSheet.show(
                    isExpanded: false,
                    context: context,
                    child: const ProductSortContainer(),
                  );
                },
              ),
            ],
          ),
          SliverFillRemaining(
            child: ProductsList(
              showCurrentStock: true,
              onTap: (product) {
                productCategoryController.changeType(null);
                productController.product = product;
                Get.to<void>(() => const ProductDetails());
              },
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: AppColors.blue600,
        elevation: 16,
        onPressed: () {
          Get.to<void>(
            () => const AddProduct(
              addProductEnum: AddProductEnum.add,
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
