import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/stock/stock_in_out_items.dart';
import 'package:inventory_keeper/src/utility/app_constants.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/app_snackbar.dart';
import 'package:inventory_keeper/src/widgets/section_divider.dart';
import 'package:provider/provider.dart';

///
class StockInOutForm extends StatelessWidget {
  ///
  const StockInOutForm({Key? key, required this.isStockIn}) : super(key: key);

  ///
  final bool isStockIn;

  ///
  static const routeName = '/stockInOutForm';
  @override
  Widget build(BuildContext context) {
    final stockController = context.watch<StockController>();
    final productController = context.watch<ProductController>();
    final titleLabel = isStockIn ? 'Stock In' : 'Stock Out';
    final color = isStockIn ? Colors.teal : Colors.red;
    return WillPopScope(
      onWillPop: () => _onBackPressed(context, stockController.products)
          .then((value) => value ?? false),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).canvasColor,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
            onPressed: () =>
                _onBackPressed(context, stockController.products).then((value) {
              if (value ?? false) {
                Navigator.pop(context);
              }
            }),
            icon: const Icon(Icons.close),
          ),
          title: Text(titleLabel),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          titleLabel,
                          style: TextStyle(
                            color: color,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SectionDivider(
                        color: color,
                      ),
                      ListTile(
                        title: const Text('Item'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${stockController.products.length} Items'),
                            const SizedBox(
                              width: 16,
                            ),
                            const Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            StockInOutItems.routeName,
                            arguments: {'isStockIn': isStockIn},
                          );
                        },
                      ),
                      const SectionDivider(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          itemCount: stockController.products.length,
                          itemBuilder: (context, index) {
                            final products = stockController.products;
                            var selectedQuantity =
                                products[index].selectedQuantity;
                            if (selectedQuantity != null) {
                              selectedQuantity = isStockIn
                                  ? selectedQuantity
                                  : selectedQuantity * -1;
                            }
                            return ProductItem(
                              item: products[index],
                              trailing: Text(
                                '${selectedQuantity ?? ''}',
                                style: TextStyle(color: color),
                              ),
                              onTap: () {
                                productController.product = products[index];
                                Navigator.pushNamed(
                                  context,
                                  ProductDetails.routeName,
                                ).then((value) =>
                                    productController.product = null);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      'Total Cost: ${oCcy.format(stockController.totalAmount)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.blue700,
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                          left: 14,
                          right: 24,
                        ),
                      ),
                      onPressed: () {
                        if (stockController.products.isEmpty) {
                          AppSnackbar().show(context, 'Add items first');
                        } else {
                          loadDialog<void>(
                            context,
                            loadingText: 'Updating stock...',
                          );
                          stockController.addStock(isStockIn).then(
                            (products) {
                              if (products.isNotEmpty) {
                                context
                                    .read<ProductController>()
                                    .updateProducts(products)
                                    .then((success) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                });
                              } else {
                                Navigator.pop(context);
                                AppSnackbar()
                                    .show(context, 'Failed to update stock');
                              }
                            },
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///
  Future<bool?> _onBackPressed(BuildContext context, List<Product> products) {
    if (products.isEmpty) {
      return Future.value(true);
    } else {
      // set up the buttons
      final cancelButton = ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.blue700,
        ),
        child: const Text(
          'Cancel',
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      );
      final continueButton = TextButton(
        child: const Text(
          'Delete',
          style: TextStyle(color: Colors.red),
        ),
        onPressed: () {
          for (var p in products) {
            p = p.copyWith(selectedQuantity: 0);
          }
          context.read<StockController>().removeAllFromCart();
          var count = 0;
          Navigator.popUntil(context, (route) {
            return count++ == 2;
          });
        },
      );
      // set up the AlertDialog
      final alert = AlertDialog(
        title: const Text('Quit Stock Out'),
        content: const Text('Delete Draft?'),
        actions: [
          cancelButton,
          continueButton,
        ],
      );
      // show the dialog
      return showDialog<bool>(
        context: context,
        builder: (BuildContext context) => alert,
      );
    }
  }
}
