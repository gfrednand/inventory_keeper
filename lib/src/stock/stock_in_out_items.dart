import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/product_type/product_types_selector.dart';
import 'package:inventory_keeper/src/products/current_stock_quantity.dart';
import 'package:inventory_keeper/src/products/product_detail_bottom_bar.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:provider/provider.dart';

///
class StockInOutItems extends StatelessWidget {
  ///
  const StockInOutItems({Key? key, required this.isStockIn}) : super(key: key);

  ///
  final bool isStockIn;

  ///
  static const routeName = '/stockInOutItems';

  @override
  Widget build(BuildContext context) {
    final productController = context.watch<ProductController>();
    final stockController = context.watch<StockController>();
    final titleLabel = isStockIn ? 'Stock In Items' : 'Stock Out Items';
    final color = isStockIn ? Colors.teal : Colors.red;
    final products = context.watch<List<Product>?>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
        title: Text(titleLabel),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
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
                      if (productController.type != null) {
                        data = data
                            .where(
                              (p) =>
                                  p.type?.name == productController.type?.name,
                            )
                            .toList();
                        if (data.isEmpty) {
                          return Center(
                            child: Text(
                              'Category *${productController.type!.name}*\n Has No Products',
                              style: const TextStyle(fontSize: 24),
                            ),
                          );
                        }
                      }

                      if (data.isNotEmpty) {
                        var selectedProducts = <Product>[];
                        selectedProducts = stockController.products;
                        data = data.map((p) {
                          if (products != null) {
                            final selectedProduct = selectedProducts.firstWhere(
                              (prod) => prod.id == p.id,
                              orElse: () => Product(name: 'null', unit: 'null'),
                            );
                            if (selectedProduct.id != null) {
                              return p.copyWith(
                                selectedQuantity:
                                    selectedProduct.selectedQuantity,
                              );
                            }
                          }
                          return p;
                        }).toList();
                        return ListView.separated(
                          // Providing a restorationId allows the ListView to restore
                          // The scroll position when a user leaves and returns to
                          // The app after it has been killed while running in the
                          // Background.
                          restorationId: 'productListView',
                          itemCount: data.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (BuildContext context, int index) {
                            final item = data![index];

                            var selectedQuantity = item.selectedQuantity;
                            if (selectedQuantity != null) {
                              selectedQuantity = isStockIn
                                  ? selectedQuantity
                                  : selectedQuantity * -1;
                            }

                            return ProductItem(
                              item: item,
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${item.currentStock}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(171, 158, 158, 158),
                                    ),
                                  ),
                                  Text(
                                    '${selectedQuantity ?? ''}',
                                    style: TextStyle(
                                      color: color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                displayDialog<int>(
                                  context,
                                  StockQuantityField(
                                    currentQuantity: item.currentStock,
                                    productName: item.name,
                                    isIncrement: isStockIn,
                                    title:
                                        '${isStockIn ? 'Stock In' : 'Stock Out'} quantity',
                                    counter: item.selectedQuantity ?? 0,
                                    initialCounter: item.currentStock +
                                        (item.selectedQuantity ?? 0),
                                  ),
                                ).then((value) {
                                  if (value != null && value > 0) {
                                    item.selectedQuantity = value;
                                    context
                                        .read<StockController>()
                                        .addToCart(item);
                                  }
                                });
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
          ),
          ProductDetailBottomBar(
            onPressed: () {
              Navigator.pop(context);
            },
            buttonLabel: 'Done',
            quantityWidget: CurrentStockQuantity(
              currentStock: stockController.totalQuantity,
            ),
          ),
        ],
      ),
    );
  }
}
