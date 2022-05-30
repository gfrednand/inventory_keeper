import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
import 'package:inventory_keeper/src/products/current_stock_quantity.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/products/products_list.dart';
import 'package:inventory_keeper/src/stock/low_stock_reminder_settings.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

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
    final productController = Get.find<ProductController>();
    const excessFactor = 10;

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
            onPressed: () {
              Get.to<void>(() => const LowStockReminderSettings());
            },
            icon: const Icon(Icons.settings_outlined),
          )
        ],
        title: const Text('Safety Stock'),
      ),
      body: GetBuilder<ProductController>(builder: (cont) {
        final products = productController.products
            .where((p) => p.safetyStock > p.currentStock)
            .toList();
        final excessProducts = productController.products
            .where((p) => p.currentStock > (p.safetyStock + excessFactor))
            .toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color.fromARGB(255, 236, 232, 232),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                onTap: () {
                  productController.filteredProductsByNameAndCategory();
                  Get.to<void>(() => Scaffold(
                        body: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: ProductsList(
                            closeLabel: 'Done',
                            onTap: (Product item) {
                              displayDialog<Map<String, int?>>(
                                context,
                                StockQuantityField(
                                  productName: item.name,
                                  title: 'Safety Stock',
                                  counter: item.safetyStock,
                                  transactionType: TransactionType.all,
                                ),
                              ).then((map) {
                                final value = map?['quantity'];
                                if (value != null && value > 0) {
                                  Get.find<ProductController>()
                                      .updateProductSafetyStock(item, value);
                                }
                              });
                            },
                          ),
                        ),
                      ));
                },
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
                'Low stock items (${products.length})',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.orange,
                ),
              ),
            ),
            generateProductsList(products),
            if (excessProducts.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Excess stock items (${excessProducts.length})',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.teal),
                ),
              ),
            if (excessProducts.isNotEmpty) generateProductsList(excessProducts)
          ],
        );
      }),
    );
  }

  ListView generateProductsList(List<Product> products) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return ProductItem(
          item: products[index],
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CurrentStockQuantity(
                backGroundColor: Colors.green,
                currentStock: products[index].safetyStock,
                withBackground: true,
                fontSize: 16,
              ),
              const SizedBox(
                height: 4,
              ),
              CurrentStockQuantity(
                checkCurrentStock: false,
                backGroundColor: const Color(0xFFBDBDBD),
                currentStock: products[index].currentStock,
                fontSize: 16,
              ),
            ],
          ),
          onTap: () {
            // Navigate to the details page. If the user leaves and
            // returns to the app after it has been killed while running
            // in the background, the navigation stack is restored.

            Get.to<void>(
              () => const ProductDetails(),
              arguments: products[index],
            );
          },
        );
      },
      itemCount: products.length,
    );
  }
}
