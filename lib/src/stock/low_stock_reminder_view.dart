import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/product_type/product_types_selector.dart';

import 'package:inventory_keeper/src/products/current_stock_quantity.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/stock/add_item_safety_quntity.dart';

import 'package:provider/provider.dart';

/// Displays a list of Products.
class LowStockReminderView extends StatelessWidget {
  ///
  const LowStockReminderView({
    Key? key,
    this.products = const [],
  }) : super(key: key);

  /// Product list route
  static const routeName = '/lowStockReminderView';

  /// Products to be displayed
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();
    final products = context
        .watch<List<Product>?>()
        ?.where((p) => p.safetyStock > p.currentStock)
        .toList();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).canvasColor,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.settings_outlined))
        ],
        title: const Text('Safety Stock'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color.fromARGB(255, 236, 232, 232),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListTile(
              onTap: () =>
                  Navigator.pushNamed(context, AddItemSafetyQuantity.routeName),
              leading: const Icon(Icons.speed_outlined),
              title: const Text("Add item's safety stock quantity"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Low stock items (${products?.length ?? 0})',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          Builder(builder: (context) {
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
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }
            }
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(
                  item: data![index],
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CurrentStockQuantity(
                        backGroundColor: Colors.green,
                        currentStock: data[index].safetyStock,
                        withBackground: true,
                        fontSize: 16,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      CurrentStockQuantity(
                        checkCurrentStock: false,
                        backGroundColor: const Color(0xFFBDBDBD),
                        currentStock: data[index].currentStock,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  onTap: () {
                    // Navigate to the details page. If the user leaves and
                    // returns to the app after it has been killed while running
                    // in the background, the navigation stack is restored.

                    controller.product = data![index];
                    Navigator.pushNamed(
                      context,
                      ProductDetails.routeName,
                    ).then((value) => controller.product = null);
                  },
                );
              },
              itemCount: data.length,
            );
          }),
        ],
      ),
    );
  }
}
