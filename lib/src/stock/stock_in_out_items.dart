import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/cart_controller.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_type_controller.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';
import 'package:inventory_keeper/src/controllers/transaction_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
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
  const StockInOutItems({Key? key, required this.transactionType})
      : super(key: key);

  ///
  final TransactionType transactionType;

  ///
  static const routeName = '/stockInOutItems';

  @override
  Widget build(BuildContext context) {
    // final cartController = Get.put(CartController());
    final cartController = Get.find<CartController>();
    final productTypeController = Get.find<ProductTypeController>();
    final transactionController = Get.find<TransactionController>();
    String? titleLabel;
    Color? color;

    if (transactionType == TransactionType.inStock) {
      titleLabel = 'Stock In Items';
      color = Colors.teal;
    } else if (transactionType == TransactionType.outStock) {
      titleLabel = 'Stock Out Items';
      color = Colors.red;
    } else if (transactionType == TransactionType.audit) {
      titleLabel = 'Audit Items';
      color = Colors.orange;
    }
    final unProcesedProducts = Get.find<ProductController>().products;
    var products = <Product>[];
    final currentStock = transactionController.getTransactionSummary();
    if (currentStock.productsSummary.isNotEmpty) {
      final productsSummary = currentStock.productsSummary;
      for (final item in unProcesedProducts) {
        var p = item;
        p = p.copyWith(
          currentStock: productsSummary
                  .firstWhereOrNull((pSummary) => pSummary.id == item.id)
                  ?.currentStock ??
              0,
        );
        products.add(p);
      }
    } else {
      products = unProcesedProducts;
    }
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
        title: Text(titleLabel ?? ''),
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
                        return GetBuilder<CartController>(
                          builder: (context) {
                            return ListView.separated(
                              restorationId: 'productListView',
                              itemCount: data.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SectionDivider(),
                              itemBuilder: (BuildContext context, int index) {
                                final item = data[index];
                                var selectedQuantity =
                                    cartController.items[item.id]?.quantity;
                                if (selectedQuantity != null) {
                                  if (transactionType ==
                                      TransactionType.inStock) {
                                    selectedQuantity = selectedQuantity;
                                  } else if (transactionType ==
                                      TransactionType.outStock) {
                                    selectedQuantity = selectedQuantity * -1;
                                  }
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
                                          color: Color.fromARGB(
                                            171,
                                            158,
                                            158,
                                            158,
                                          ),
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
                                    var title = '';
                                    if (transactionType ==
                                        TransactionType.inStock) {
                                      title = 'Stock In quantity';
                                    } else if (transactionType ==
                                        TransactionType.outStock) {
                                      title = 'Stock Out quantity';
                                    } else if (transactionType ==
                                        TransactionType.audit) {
                                      title = 'Audit quantity';
                                    }
                                    displayDialog<int>(
                                      context,
                                      StockQuantityField(
                                        currentStock: item.currentStock,
                                        productName: item.name,
                                        isIncrement: transactionType ==
                                                TransactionType.inStock ||
                                            transactionType ==
                                                TransactionType.audit,
                                        title: title,
                                        counter: selectedQuantity ?? 0,
                                        initialCounter: item.currentStock +
                                            (selectedQuantity ?? 0),
                                      ),
                                    ).then((value) {
                                      if (value != null) {
                                        var currentStock = 0;
                                        if (transactionType ==
                                            TransactionType.inStock) {
                                          currentStock =
                                              item.currentStock + value;
                                        } else if (transactionType ==
                                            TransactionType.outStock) {
                                          currentStock =
                                              item.currentStock - value;
                                        } else if (transactionType ==
                                            TransactionType.audit) {
                                          currentStock = value;
                                        }
                                        cartController.addItem(
                                          amount: transactionType ==
                                                  TransactionType.inStock
                                              ? item.buyPrice
                                              : transactionType ==
                                                      TransactionType.outStock
                                                  ? item.salePrice
                                                  : 0,
                                          id: item.id ?? '',
                                          name: item.name,
                                          quantity: value,
                                          currentStock: currentStock,
                                        );
                                      }
                                    });
                                  },
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
                )
              ],
            ),
          ),
          GetBuilder<CartController>(
            builder: (cont) {
              return ProductDetailBottomBar(
                onPressed: Get.back,
                buttonLabel: 'Done',
                quantityWidget: CurrentStockQuantity(
                  currentStock: cartController.totalQuantity,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
