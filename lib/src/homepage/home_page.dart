import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/controllers/transaction_controller.dart';
import 'package:inventory_keeper/src/homepage/home_item_container.dart';
import 'package:inventory_keeper/src/homepage/stock_in_out_container.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/past_quantity_view.dart';
import 'package:inventory_keeper/src/stock/low_stock_reminder_view.dart';
import 'package:inventory_keeper/src/transaction/transaction_detail_item_part.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/widgets/custom_appbar.dart';

///Home page
class HomePage extends StatelessWidget {
  ///Home page constructor
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final transactionController = Get.find<TransactionController>();

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
                  Obx(
                    () {
                      final currentStock =
                          transactionController.getTransactionSummary();

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
                                      quantityColor: Colors.white,
                                      quantity: '${currentStock.totalQuantity}',
                                      label: 'Total',
                                    ),
                                    const VerticalDivider(thickness: 2),
                                    TransactionDetailItemPart(
                                      quantityColor: Colors.white,
                                      quantity: '${currentStock.totalIn}',
                                      label: 'Stock In',
                                    ),
                                    const VerticalDivider(thickness: 2),
                                    TransactionDetailItemPart(
                                      quantityColor: Colors.white,
                                      quantity: '${currentStock.totalOut}',
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
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HomeItemContainer(
                    label: 'Add Item',
                    child: ListTile(
                      onTap: () {
                        Get.to<void>(
                          () => const AddProduct(),
                          transition: Transition.leftToRight,
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
                      onTap: () => Get.to<void>(
                        () => const LowStockReminderView(),
                        transition: Transition.downToUp,
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
                      onTap: () => Get.to<void>(
                        () => const PastQuantityView(),
                        transition: Transition.downToUp,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Text(
                      'Inventory Keeper',
                      style: GoogleFonts.indieFlower(fontSize: 20),
                    ),
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
