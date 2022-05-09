import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/current_stock_quantity.dart';
import 'package:inventory_keeper/src/products/custom_detail_item_tile.dart';
import 'package:inventory_keeper/src/products/product_detail_bottom_bar.dart';
import 'package:inventory_keeper/src/stock/stock_in_out_form.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/modal_sheet.dart';
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
              _showDeleteMenu(context, controller);
            },
            icon: const Icon(Icons.more_horiz_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                    controller.product?.currentStock ?? 0,
                                withBackground: true,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              const Text(
                                'Total Quantity',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
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
                padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    CustomDetailItemTile(
                      label: 'Cost',
                      value: oCcy.format(controller.product?.buyPrice ?? 0),
                    ),
                    CustomDetailItemTile(
                      label: 'Price',
                      value: oCcy.format(controller.product?.salePrice ?? 0),
                    ),
                    const Divider(),
                    CustomDetailItemTile(
                      label: 'Category',
                      value: controller.product?.type?.name ?? '-',
                    ),
                    const Divider(),
                    CustomDetailItemTile(
                      label: 'Safety Stock',
                      value: '${controller.product?.safetyStock ?? '-'}',
                    ),
                    const Divider(),
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
      bottomNavigationBar: ProductDetailBottomBar(
        onPressed: () {
          showStockInOutMenu(context);
        },
        buttonLabel: 'Stock In/Out',
        quantityWidget: Hero(
          tag: 'currentstock-${controller.product?.id}',
          child: CurrentStockQuantity(
            currentStock: controller.product?.currentStock ?? 0,
          ),
        ),
      ),
    );
  }

  void _showDeleteMenu(BuildContext context, ProductController controller) {
    CustomModalSheet.show(
      isExpanded: false,
      context: context,
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            TextButton(
              onPressed: controller.removeProduct,
              child: const Text('Delete'),
            )
          ],
        ),
      ),
    );
  }
}
