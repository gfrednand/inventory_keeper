import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/controllers/closing_stock_controller.dart';
import 'package:inventory_keeper/src/models/closing_stock/closing_stock.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/products/current_stock_quantity.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

import 'package:provider/provider.dart';

/// Displays a list of Products.
class PastQuantityView extends StatefulWidget {
  ///
  const PastQuantityView({
    Key? key,
    this.products = const [],
  }) : super(key: key);

  /// Product list route
  static const routeName = '/pastQuantityView';

  /// Products to be displayed
  final List<Product> products;

  @override
  State<PastQuantityView> createState() => _PastQuantityViewState();
}

class _PastQuantityViewState extends State<PastQuantityView> {
  String? currentDate;
  ClosingStock? closingStock;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ClosingStockController>();
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
        title: const Text('Past Quantity'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 236, 232, 232),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListTile(
              onTap: () {
                selectDate(context).then((value) async {
                  if (value != null) {
                    currentDate = DateFormat.yMMMEd().format(value);
                    closingStock =
                        await controller.getClosingStockByDate(currentDate!);
                    setState(() {});
                  }
                });
              },
              title: Text(currentDate ?? 'Select Date'),
              trailing: const Icon(
                Icons.arrow_downward_outlined,
                size: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Builder(
            builder: (context) {
              if (closingStock == null) {
                return const Center(
                  child: Text('No Data'),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(
                    item: closingStock!.products[index],
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CurrentStockQuantity(
                          backGroundColor: Colors.green,
                          currentStock:
                              closingStock!.products[index].safetyStock,
                          withBackground: true,
                          fontSize: 16,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        CurrentStockQuantity(
                          checkCurrentStock: false,
                          backGroundColor: const Color(0xFFBDBDBD),
                          currentStock:
                              closingStock!.products[index].currentStock,
                          fontSize: 16,
                        ),
                      ],
                    ),
                    onTap: () {
                      // Navigate to the details page. If the user leaves and
                      // returns to the app after it has been killed while running
                      // in the background, the navigation stack is restored.

                      // controller.product = data[index];
                      // Navigator.pushNamed(
                      //   context,
                      //   ProductDetails.routeName,
                      // ).then((value) => controller.product = null);
                    },
                  );
                },
                itemCount: closingStock!.products.length,
              );
            },
          ),
        ],
      ),
    );
  }
}
