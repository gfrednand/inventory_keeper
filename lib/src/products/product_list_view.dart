import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_type_controller.dart';
import 'package:inventory_keeper/src/controllers/transaction_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/product_type/product_types_selector.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/current_stock_quantity.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/products/product_search_delegate.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/custom_appbar.dart';

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
    final products = Get.find<ProductController>().products;
    final productTypeController = Get.find<ProductTypeController>();
    return Scaffold(
      body: CustomScrollView(
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
            ],
          ),
          SliverAppBar(
            backgroundColor: AppColors.blue50Alpha060,
            pinned: true,
            bottom: PreferredSize(
              // Add this code
              preferredSize: const Size.fromHeight(40), // Add this code
              child: Container(), // Add this code
            ),
            flexibleSpace: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: ProductTypesSelector(allProducts: products),
            ),
          ),
          GetBuilder(
            init: ProductTypeController(),
            builder: (cont) {
              var data = products;
              if (productTypeController.type != null) {
                data = data
                    .where(
                      (p) => p.type?.name == productTypeController.type?.name,
                    )
                    .toList();
                if (data.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'Category *${productTypeController.type?.name}*\n Has No Products',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                }
              }

              final stock =
                  Get.find<TransactionController>().getTransactionSummary();
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    data[index] = productWithLatestInfo(data[index], stock);
                    return ProductItem(
                      item: data[index],
                      trailing: CurrentStockQuantity(
                        currentStock: data[index].currentStock,
                      ),
                      onTap: () {
                        productTypeController.changeType(null);
                        Get.to<void>(
                          () => const ProductDetails(),
                          arguments: data[index],
                        );
                      },
                    );
                  },
                  childCount: data.length,
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: AppColors.blue600,
        elevation: 16,
        onPressed: () {
          Get.to<void>(
            () => const AddProduct(),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
