import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/cart_controller.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_type_controller.dart';
import 'package:inventory_keeper/src/product_type/product_types_selector.dart';
import 'package:inventory_keeper/src/products/current_stock_quantity.dart';
import 'package:inventory_keeper/src/products/product_detail_bottom_bar.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/section_divider.dart';

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
    // final cartController = Get.put(CartController());
    final cartController = Get.find<CartController>();
    final productTypeController = Get.find<ProductTypeController>();
    final products = Get.find<ProductController>().products;
    final titleLabel = isStockIn ? 'Stock In Items' : 'Stock Out Items';
    final color = isStockIn ? Colors.teal : Colors.red;
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
                  child: GetBuilder<ProductTypeController>(
                    builder: (cont) {
                      var data = products;
                      if (productTypeController.type != null) {
                        data = data
                            .where(
                              (p) =>
                                  p.type?.name ==
                                  productTypeController.type?.name,
                            )
                            .toList();
                        if (data.isEmpty) {
                          return Center(
                            child: Text(
                              'Category *${productTypeController.type!.name}*\n Has No Products',
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }
                      }

                      if (data.isNotEmpty) {
                        return GetBuilder<CartController>(builder: (context) {
                          return ListView.separated(
                            restorationId: 'productListView',
                            itemCount: data.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SectionDivider(),
                            itemBuilder: (BuildContext context, int index) {
                              final item = data[index];
                              var selectedQuantity = cartController
                                  .items[item.id]?.selectedQuantity;
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
                                        color:
                                            Color.fromARGB(171, 158, 158, 158),
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
                                      counter: selectedQuantity ?? 0,
                                      initialCounter: item.currentStock +
                                          (selectedQuantity ?? 0),
                                    ),
                                  ).then((value) {
                                    if (value != null) {
                                      cartController.addItem(
                                        amount: isStockIn
                                            ? item.buyPrice
                                            : item.salePrice,
                                        id: item.id ?? '',
                                        name: item.name,
                                        selectedQuantity: value,
                                        currentQuantity: item.currentStock,
                                        isIncoming: isStockIn,
                                      );
                                    }
                                  });
                                },
                              );
                            },
                          );
                        });
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
          GetBuilder<CartController>(builder: (cont) {
            return ProductDetailBottomBar(
              onPressed: Get.back,
              buttonLabel: 'Done',
              quantityWidget: CurrentStockQuantity(
                currentStock: cartController.totalQuantity,
              ),
            );
          }),
        ],
      ),
    );
  }
}
