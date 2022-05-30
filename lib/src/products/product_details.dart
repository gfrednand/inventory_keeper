import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/transaction_controller.dart';
import 'package:inventory_keeper/src/homepage/stock_in_out_container.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/current_stock_quantity.dart';
import 'package:inventory_keeper/src/products/custom_detail_item_tile.dart';
import 'package:inventory_keeper/src/products/product_detail_bottom_bar.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/app_delete_menu.dart';
import 'package:inventory_keeper/src/widgets/modal_sheet.dart';
import 'package:inventory_keeper/src/widgets/section_divider.dart';

/// Add Product Page
class ProductDetails extends StatelessWidget {
  ///
  const ProductDetails({Key? key, this.showTransactionButton = true})
      : super(key: key);

  /// Add Product route name
  static const routeName = '/productDetails';

  ///
  final bool showTransactionButton;

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    final transactionController = Get.find<TransactionController>();
    var product = productController.product;
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
              Get.to<void>(
                () => AddProduct(
                  addProductEnum: AddProductEnum.edit,
                  product: product,
                ),
              );
            },
            icon: const Icon(Icons.edit_note_outlined),
          ),
          IconButton(
            onPressed: () {
              AppDeleteMenu().show(context, productController);
            },
            icon: const Icon(Icons.more_horiz_rounded),
          ),
        ],
      ),
      body: Obx(() {
        if (product != null) {
          product = productWithLatestInfo(
            product!,
            transactionController.getTransactionSummary(),
          );
        }
        return Column(
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
                                tag: 'avatar-${product?.id}',
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product?.name ?? '-',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 94, 94, 94),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Wrap(
                                    spacing: 5,
                                    children: [
                                      CurrentStockQuantity(
                                        currentStock:
                                            product?.currentStock ?? 0,
                                        withBackground: true,
                                      ),
                                      const Text(
                                        'Total Quantity',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.blue600,
                                        ),
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
                              value: oCcy.format(product?.buyPrice ?? 0),
                            ),
                            CustomDetailItemTile(
                              hintText: 'Selling Price of Item',
                              label: 'Price',
                              value: oCcy.format(product?.salePrice ?? 0),
                            ),
                            const SectionDivider(),
                            CustomDetailItemTile(
                              label: 'Category',
                              value: product?.type?.name ?? '-',
                            ),
                            const SectionDivider(),
                            CustomDetailItemTile(
                              hintText: 'Used for notification',
                              label: 'Safety Stock',
                              value: '${product?.safetyStock ?? 0}',
                            ),
                            const SectionDivider(),
                            CustomDetailItemTile(
                              label: 'Unit Of Measure',
                              value: product?.unit ?? '-',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (showTransactionButton)
              ProductDetailBottomBar(
                onPressed: () {
                  CustomModalSheet.show(
                    isExpanded: false,
                    context: context,
                    child: StockInOutContainer(
                      product: product,
                      label: 'Select',
                      ctx: context,
                    ),
                  );
                },
                buttonLabel: 'Items In/Out',
                quantityWidget: Hero(
                  tag: 'currentstock-${product?.id}',
                  child: CurrentStockQuantity(
                    currentStock: product?.currentStock ?? 0,
                  ),
                ),
              )
            else
              Container(),
          ],
        );
      }),
    );
  }
}
