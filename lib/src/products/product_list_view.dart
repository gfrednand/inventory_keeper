import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_type_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/product_type/product_types_selector.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/current_stock_quantity.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/products/product_search_delegate.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
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
    final controller = Get.find<ProductController>();
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
            backgroundColor: Theme.of(context).canvasColor,
            pinned: true,
            bottom: PreferredSize(
              // Add this code
              preferredSize: const Size.fromHeight(40), // Add this code
              child: Container(), // Add this code
            ),
            flexibleSpace: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: const ProductTypesSelector(),
            ),
          ),

          Obx(
            () {
              var data = controller.products;
              if (productTypeController.type?.value != null) {
                data = data
                    .where((p) =>
                        p.type?.name == productTypeController.type?.value.name)
                    .toList();
                if (data.isEmpty) {
                  return Obx(() {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Category *${productTypeController.type!.value.name}*\n Has No Products',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  });
                }
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ProductItem(
                      item: data[index],
                      trailing: CurrentStockQuantity(
                        currentStock: data[index].currentStock,
                      ),
                      onTap: () {
                        // Navigate to the details page. If the user leaves and
                        // returns to the app after it has been killed while running
                        // in the background, the navigation stack is restored.

                        controller.product = data[index];
                        Navigator.pushNamed(
                          context,
                          ProductDetails.routeName,
                        ).then((value) => controller.product = null);
                      },
                    );
                  },
                  childCount: data.length,
                ),
              );
            },
          ),
          //   SliverFillRemaining(
          //     child: Column(
          //       children: [
          //         const Padding(
          //           padding: EdgeInsets.all(8),
          //           child: ProductTypesSelector(),
          //         ),
          //         Expanded(
          //           child: Builder(
          //             builder: (_) {
          //               var data = products;
          //               if (data == null) {
          //                 return const Center(
          //                   child: CircularProgressIndicator(),
          //                 );
          //               }
          //               if (controller.type != null) {
          //                 data = data
          //                     .where((p) => p.type?.name == controller.type?.name)
          //                     .toList();
          //                 if (data.isEmpty) {
          //                   return Center(
          //                     child: Text(
          //                       'Category *${controller.type!.name}*\n Has No Products',
          //                       style: const TextStyle(fontSize: 24),
          //                     ),
          //                   );
          //                 }
          //               }

          //               if (data.isNotEmpty) {
          //                 return ListView.separated(
          //                   // Providing a restorationId allows the ListView to restore the
          //                   // scroll position when a user leaves and returns to the app after
          //                   // it has been killed while running in the background.
          //                   restorationId: 'productListView',
          //                   itemCount: data.length,
          //                   separatorBuilder: (BuildContext context, int index) =>
          //                       const Divider(),
          //                   itemBuilder: (BuildContext context, int index) {
          //                     final item = data![index];
          //                     return ProductItem(
          //                       item: item,
          //                       trailing: Hero(
          //                         tag: 'currentstock-${item.id}',
          //                         child: CurrentStockQuantity(
          //                           currentStock: item.currentStock,
          //                         ),
          //                       ),
          //                       onTap: () {
          //                         // Navigate to the details page. If the user leaves and
          //                         // returns to the app after it has been killed while running
          //                         // in the background, the navigation stack is restored.

          //                         controller.product = item;
          //                         Navigator.pushNamed(
          //                           context,
          //                           ProductDetails.routeName,
          //                         ).then((value) => controller.product = null);
          //                       },
          //                     );
          //                   },
          //                 );
          //               } else {
          //                 return const Center(
          //                   child: Text(
          //                     'No Data',
          //                     style: TextStyle(fontSize: 32),
          //                   ),
          //                 );
          //               }
          //             },
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: AppColors.blue600,
        elevation: 16,
        onPressed: () {
          controller.product = null;
          Navigator.restorablePushNamed(
            context,
            AddProduct.routeName,
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
