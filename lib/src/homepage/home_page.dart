import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_type_controller.dart';
import 'package:inventory_keeper/src/controllers/transaction_controller.dart';
import 'package:inventory_keeper/src/homepage/home_item_container.dart';
import 'package:inventory_keeper/src/homepage/stock_in_out_container.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/products/past_quantity_view.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
import 'package:inventory_keeper/src/products/products_list.dart';
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
    final productController = Get.find<ProductController>();
    final productTypeController = Get.find<ProductTypeController>();

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
                      final currentStock = productController.currentStock;

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
                                      quantity:
                                          '${currentStock?.totalQuantity ?? 0}',
                                      label: 'Total',
                                    ),
                                    const VerticalDivider(thickness: 2),
                                    TransactionDetailItemPart(
                                      quantityColor: Colors.white,
                                      quantity: '${currentStock?.totalIn ?? 0}',
                                      label: 'Items In',
                                    ),
                                    const VerticalDivider(thickness: 2),
                                    TransactionDetailItemPart(
                                      quantityColor: Colors.white,
                                      quantity:
                                          '${currentStock?.totalOut ?? 0}',
                                      label: 'Items Out',
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
                    child: ListTile(
                      onTap: () {
                        productController.filteredProductsByNameAndCategory();
                        Get.to<void>(
                          () => Scaffold(
                            body: Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: ProductsList(
                                showCurrentStock: true,
                                closeLabel: 'Close',
                                onTap: (Product item) {
                                  productTypeController.changeType(null);
                                  productController.product = item;
                                  Get.to<void>(() => const ProductDetails());
                                },
                              ),
                            ),
                          ),
                        );
                      },
                      leading: const Icon(
                        Icons.search,
                        color: AppColors.blue200,
                      ),
                      title: const Text(
                        'Search Item',
                        style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue200,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HomeItemContainer(
                    label: 'Add Item',
                    child: ListTile(
                      onTap: () {
                        Get.to<void>(
                          () => const AddProduct(
                            addProductEnum: AddProductEnum.add,
                          ),
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
                    label: 'Items In/ Out',
                    ctx: context,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HomeItemContainer(
                    label: 'Low Items Reminder',
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
