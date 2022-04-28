import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/products/product.dart';
import 'package:inventory_keeper/src/products/product_controller.dart';
import 'package:inventory_keeper/src/products/product_details_view.dart';
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
      body: StreamBuilder(
        stream: controller.fetchProductsAsStream(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView.builder(
              // Providing a restorationId allows the ListView to restore the
              // scroll position when a user leaves and returns to the app after
              // it has been killed while running in the background.
              restorationId: 'productListView',
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                final item = data[index];
                return ListTile(
                  title: Text('Product ${item.id}'),
                  leading: const CircleAvatar(
                      // Display the Flutter Logo image asset.
                      // foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                      ),
                  onTap: () {
                    // Navigate to the details page. If the user leaves and
                    // returns to the app after it has been killed while running
                    // in the background, the navigation stack is restored.
                    Navigator.restorablePushNamed(
                      context,
                      ProductDetailsView.routeName,
                    );
                  },
                );
              },
            );
          } else {
            // return const Center(
            //   child: Text(
            //     'No Products',
            //     style: TextStyle(fontSize: 32),
            //   ),
            // );
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
