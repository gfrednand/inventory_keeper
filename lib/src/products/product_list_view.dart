import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/product_type/product_types_selector.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/current_stock_quantity.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/products/product_search_delegate.dart';
import 'package:provider/provider.dart';

/// Displays a list of Products.
class ProductListView extends StatelessWidget {
  ///
  const ProductListView({
    Key? key,
    this.products = const [],
  }) : super(key: key);

  /// Product list route
  static const routeName = '/productListView';

  /// Products to be displayed
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();
    final products = context.watch<List<Product>?>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
        // leading: Container(),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch<Product?>(
                context: context,
                delegate: ProductSearchDelegate(),
              );
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: ProductTypesSelector(),
          ),
          Expanded(
            child: Builder(
              builder: (_) {
                var data = products;
                if (data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (controller.type != null) {
                  data = data
                      .where((p) => p.type?.name == controller.type?.name)
                      .toList();
                  if (data.isEmpty) {
                    return Center(
                      child: Text(
                        'Category *${controller.type!.name}*\n Has No Products',
                        style: const TextStyle(fontSize: 24),
                      ),
                    );
                  }
                }

                if (data.isNotEmpty) {
                  return ListView.separated(
                    // Providing a restorationId allows the ListView to restore the
                    // scroll position when a user leaves and returns to the app after
                    // it has been killed while running in the background.
                    restorationId: 'productListView',
                    itemCount: data.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      final item = data![index];
                      return ProductItem(
                        item: item,
                        trailing: Hero(
                          tag: 'currentstock-${item.id}',
                          child: CurrentStockQuantity(
                            currentStock: item.currentStock,
                          ),
                        ),
                        onTap: () {
                          // Navigate to the details page. If the user leaves and
                          // returns to the app after it has been killed while running
                          // in the background, the navigation stack is restored.

                          controller.product = item;
                          Navigator.pushNamed(
                            context,
                            ProductDetails.routeName,
                          ).then((value) => controller.product = null);
                        },
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text(
                      'No Data',
                      style: TextStyle(fontSize: 32),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.product = null;
          Navigator.restorablePushNamed(
            context,
            AddProduct.routeName,
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
    );
  }
}
