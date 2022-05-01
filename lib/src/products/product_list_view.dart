import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/product_type/product_types_selector.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/settings/settings_view.dart';
import 'package:provider/provider.dart';

/// Displays a list of Products.
class ProductListView extends StatelessWidget {
  ///
  const ProductListView({
    Key? key,
    this.products = const [],
  }) : super(key: key);

  /// Product list route
  static const routeName = '/';

  /// Products to be displayed
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
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
            child: StreamBuilder<List<Product>>(
              stream: controller.fetchProductsAsStream(),
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
                  var data = snapshot.data;
                  if (controller.type != null) {
                    data = data!
                        .where((p) => p.type?.name == controller.type?.name)
                        .toList();
                  }

                  return ListView.builder(
                    // Providing a restorationId allows the ListView to restore the
                    // scroll position when a user leaves and returns to the app after
                    // it has been killed while running in the background.
                    restorationId: 'productListView',
                    itemCount: data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = data![index];
                      return ListTile(
                        title: Text(item.name),
                        leading: const CircleAvatar(
                            // Display the Flutter Logo image asset.
                            // foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                            ),
                        onTap: () {
                          // Navigate to the details page. If the user leaves and
                          // returns to the app after it has been killed while running
                          // in the background, the navigation stack is restored.

                          controller.product = data![index];
                          Navigator.restorablePushNamed(
                            context,
                            AddProduct.routeName,
                          );
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
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
