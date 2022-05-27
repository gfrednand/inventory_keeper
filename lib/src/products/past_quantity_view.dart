import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

/// Displays a list of Products.
class PastQuantityView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final stockController = Get.find<StockController>();
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
      body: GetBuilder<StockController>(builder: (cont) {
        final closingStock = stockController.closingStock;

        if (stockController.busy) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 236, 232, 232),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                onTap: () {
                  selectDate(context).then((value) {
                    if (value != null) {
                      stockController.getStockByDate(value);
                    }
                  });
                },
                title: Text(stockController.closingStockDate ?? 'Select Date'),
                trailing: const Icon(
                  Icons.arrow_downward_outlined,
                  size: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (closingStock == null)
              const Expanded(
                child: Center(
                  child: Text('No Data'),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final productSummary = closingStock.productsSummary[index];
                  return ListTile(
                    title: Text(
                      productSummary.name,
                      style: const TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      productSummary.amount != null
                          ? oCcy.format(productSummary.amount)
                          : '',
                    ),
                    trailing: Text(
                      '${productSummary.currentStock}',
                    ),
                  );
                },
                itemCount: closingStock.productsSummary.length,
              )
          ],
        );
      }),
    );
  }
}
