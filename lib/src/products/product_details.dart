import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/homepage/layout_page.dart';
import 'package:inventory_keeper/src/homepage/stock_in_out_container.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/current_stock_quantity.dart';
import 'package:inventory_keeper/src/products/custom_detail_item_tile.dart';
import 'package:inventory_keeper/src/products/product_detail_bottom_bar.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/app_delete_menu.dart';
import 'package:inventory_keeper/src/widgets/app_snackbar.dart';
import 'package:inventory_keeper/src/widgets/modal_sheet.dart';
import 'package:inventory_keeper/src/widgets/section_divider.dart';
import 'package:provider/provider.dart';

/// Add Product Page
class ProductDetails extends StatelessWidget {
  ///
  const ProductDetails({Key? key}) : super(key: key);

  /// Add Product route name
  static const routeName = '/productDetails';

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 209, 209),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Details'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.restorablePushNamed(
                context,
                AddProduct.routeName,
              );
            },
            icon: const Icon(Icons.edit_note_outlined),
          ),
          IconButton(
            onPressed: () {
              AppDeleteMenu().show(context, () {
                loadDialog<void>(context, loadingText: 'Deleting ....');
                controller.removeProduct().then((success) {
                  if (success) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    AppSnackbar().show(context, 'Deleted Successful');
                  } else {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    AppSnackbar().show(context, 'Not Deleted');
                  }
                });
              });
            },
            icon: const Icon(Icons.more_horiz_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Hero(
                              tag: 'avatar-${controller.product?.id}',
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 100,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.product?.name ?? '-',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 94, 94, 94),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  children: [
                                    CurrentStockQuantity(
                                      currentStock:
                                          controller.currentStockQuantity ?? 0,
                                      withBackground: true,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      'Total Quantity',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[400]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 24, left: 12, right: 12),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          CustomDetailItemTile(
                            hintText: 'Buying Cost of Item',
                            label: 'Cost',
                            value:
                                oCcy.format(controller.product?.buyPrice ?? 0),
                          ),
                          CustomDetailItemTile(
                            hintText: 'Selling Price of Item',
                            label: 'Price',
                            value:
                                oCcy.format(controller.product?.salePrice ?? 0),
                          ),
                          const SectionDivider(),
                          CustomDetailItemTile(
                            label: 'Category',
                            value: controller.product?.type?.name ?? '-',
                          ),
                          const SectionDivider(),
                          CustomDetailItemTile(
                            hintText: 'Used for notification',
                            label: 'Safety Stock',
                            value: '${controller.product?.safetyStock ?? '-'}',
                          ),
                          const SectionDivider(),
                          CustomDetailItemTile(
                            label: 'Unit Of Measure',
                            value: controller.product?.unit ?? '-',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ProductDetailBottomBar(
            onPressed: () {
              CustomModalSheet.show(
                isExpanded: false,
                context: context,
                child: StockInOutContainer(
                  title: const Text('Select'),
                  ctx: context,
                ),
              );
            },
            buttonLabel: 'Stock In/Out',
            quantityWidget: Hero(
              tag: 'currentstock-${controller.product?.id}',
              child: CurrentStockQuantity(
                currentStock: controller.currentStockQuantity ?? 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
