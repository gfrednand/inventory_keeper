import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/homepage/home_item_container.dart';
import 'package:inventory_keeper/src/homepage/stock_in_out_container.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/stock/stock.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/past_quantity_view.dart';
import 'package:inventory_keeper/src/stock/low_stock_reminder_view.dart';
import 'package:inventory_keeper/src/transaction/transaction_detail_item_part.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

///
class HomePage extends StatelessWidget {
  ///
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = context.watch<ProductController>();
    final products = context.watch<List<Product>>();
    var stockIn = 0;
    var stockOut = 0;
    context
        .watch<List<Stock>?>()
        ?.where((element) =>
            DateTime.tryParse(element.createdAt)?.day == DateTime.now().day)
        .forEach((element) {
      if (element.isIncoming) {
        stockIn = stockIn + element.totalSelectedQuantity;
      } else {
        stockOut = stockOut + element.totalSelectedQuantity;
      }
    });

    final totalQuantity =
        products.fold(0, (int currentQuantity, Product nextProduct) {
      return currentQuantity + nextProduct.currentStock;
    });
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
                  HomeItemContainer(
                    withGradient: true,
                    label:
                        'Today, ${DateFormat.MMMMd().format(DateTime.now())}',
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HomeItemContainer(
                    label: 'Add Item',
                    child: ListTile(
                      onTap: () {
                        productController.product = null;
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
                    title: const Text(
                      'Stock In/ Out',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
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
