import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
import 'package:inventory_keeper/src/products/products_list.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/section_divider.dart';

///Safety Stock Settings
class LowStockReminderSettings extends StatelessWidget {
  ///Safety Stock Settings Constructor
  const LowStockReminderSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).canvasColor,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () => Get.back<void>(),
          icon: const Icon(Icons.close),
        ),
        title: const Text(
          'Safety Stock Settings',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back<void>();
            },
            child: const Text('Save'),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: Text(
              'Item Settings',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          ListTile(
            onTap: () {
              Get.find<ProductController>().filteredProductsByNameAndCategory();
              Get.to<void>(
                () => Scaffold(
                  body: ProductsList(
                    closeLabel: 'Done',
                    onTap: (Product item) {
                      displayDialog<Map<String, int?>>(
                        context,
                        StockQuantityField(
                          productName: item.name,
                          title: 'Safety Stock',
                          counter: item.safetyStock,
                          transactionType: TransactionType.all,
                        ),
                      ).then((map) {
                        final value = map?['quantity'];
                        if (value != null && value > 0) {
                          Get.find<ProductController>()
                              .updateProductSafetyStock(item, value);
                        }
                      });
                    },
                  ),
                ),
              );
            },
            title: const Text(
              'Safey Stock',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            trailing: Wrap(
              spacing: 5,
              children: const [
                Text(
                  'Edit Quantity',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkCardBackground,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
          ),
          const SectionDivider(
            thickness: 3,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: Text(
              'Notification Settings',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          ListTile(
            title: const Text(
              'Notification',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            trailing: Switch(value: false, onChanged: (value) {}),
          ),
        ],
      ),
    );
  }
}
