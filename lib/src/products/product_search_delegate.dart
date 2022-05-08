import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:provider/provider.dart';

///
class ProductSearchDelegate extends SearchDelegate<Product?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Center(
            child: Text(
              'Search term must be longer than two letters.',
            ),
          )
        ],
      );
    }

    final products = context.watch<List<Product>>();
    final data = products
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    final controller = context.watch<ProductController>();
    return data.isEmpty
        ? Column(
            children: const <Widget>[
              Text(
                'No Results Found.',
              ),
            ],
          )
        : ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return ProductItem(
                item: item,
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
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}
