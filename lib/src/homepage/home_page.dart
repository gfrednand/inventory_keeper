import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';
import 'package:inventory_keeper/src/homepage/home_item_container.dart';
import 'package:inventory_keeper/src/homepage/stock_in_out_container.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/past_quantity_view.dart';
import 'package:inventory_keeper/src/stock/low_stock_reminder_view.dart';
import 'package:inventory_keeper/src/transaction/transaction_detail_item_part.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/widgets/custom_appbar.dart';

///
class HomePage extends StatelessWidget {
  ///
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();

    return CustomScrollView(
      slivers: [
        const CustomAppBar(
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.symmetric(horizontal: 22),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.black, fontSize: 28),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              child: Column(
                children: [
                  Obx(() {
                    final products = productController.productList.value;
                    var stockIn = 0;
                    var stockOut = 0;
                    products
                        .where((element) =>
                            element.createdAt?.day == DateTime.now().day)
                        .forEach((element) {
                      if (element.isIncomingStock ?? false) {
                        stockIn = stockIn + (element.selectedQuantity ?? 0);
                      } else {
                        stockOut = stockOut + (element.selectedQuantity ?? 0);
                      }
                    });
                    final stocks = Get.find<StockController>().stocks;

                    final index = stocks.indexWhere((element) =>
                        element.createdAt ==
                        DateFormat.yMMMEd().format(DateTime.now()));
                    if (index > -1) {
                      for (final element in stocks[index].transactions) {
                        if (element.isIncoming) {
                          stockIn = stockIn + element.totalSelectedQuantity;
                        } else {
                          stockOut = stockOut + element.totalSelectedQuantity;
                        }
                      }
                    }

                    final totalQuantity = products.fold(0,
                        (int currentQuantity, Product nextProduct) {
                      return currentQuantity + nextProduct.currentStock;
                    });
                    return HomeItemContainer(
                      withGradient: true,
                      label: 'Today',
                      moment: DateFormat.MMMMd().format(DateTime.now()),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TransactionDetailItemPart(
                                    labelColor: Colors.white,
                                    quantity: totalQuantity,
                                    label: 'Total',
                                  ),
                                  const VerticalDivider(thickness: 2),
                                  TransactionDetailItemPart(
                                    labelColor: Colors.white,
                                    quantity: stockIn,
                                    label: 'Stock In',
                                  ),
                                  const VerticalDivider(thickness: 2),
                                  TransactionDetailItemPart(
                                    labelColor: Colors.white,
                                    quantity: stockOut,
                                    label: 'Stock Out',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          )
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 24,
                  ),
                  HomeItemContainer(
                    label: 'Add Item',
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AddProduct.routeName,
                        );
                      },
                      leading: const Icon(Icons.library_add),
                      title: const Text('Register new items'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  StockInOutContainer(
                    removeCurrentRoute: false,
                    label: 'Stock In/ Out',
                    ctx: context,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HomeItemContainer(
                    label: 'Low Stock Reminder',
                    child: ListTile(
                      leading: const Icon(Icons.speed_outlined),
                      title: const Text('Check stock shortage'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                      onTap: () => Navigator.pushNamed(
                        context,
                        LowStockReminderView.routeName,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HomeItemContainer(
                    label: 'Past Quantity',
                    child: ListTile(
                      leading: const Icon(
                        Icons.history,
                        color: AppColors.orange500,
                      ),
                      title: const Text('Items past quantity'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                      onTap: () => Navigator.pushNamed(
                        context,
                        PastQuantityView.routeName,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Center(
                    child: Text('Inventory Keeper'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
