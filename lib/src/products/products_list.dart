import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/transaction_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/products/current_stock_quantity.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/search_item_category_form.dart';
import 'package:inventory_keeper/src/widgets/section_divider.dart';

///
typedef ItemSelectedCallback = void Function(Product value);

///
class ProductsList extends StatelessWidget {
  ///
  const ProductsList({
    Key? key,
    this.closeLabel,
    required this.onTap,
    this.showCurrentStock = false,
  }) : super(key: key);

  ///Closing search page label
  final String? closeLabel;

  ///
  final ItemSelectedCallback onTap;

  /// Show curretn stock
  final bool showCurrentStock;

  ///
  static const routeName = '/ProductListColumn';

  ///

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    // if (productController.filteredProducts.isEmpty) {
    //   productController.filteredProductsByNameAndCategory();
    // }

    return GetBuilder<ProductController>(builder: (cont) {
      final data = productController.filteredProducts
          .map(productWithLatestInfo)
          .toList();

      return Column(
        children: [
          SearchItemCategoryForm(closeLabel: closeLabel),
          const SectionDivider(),
          Expanded(
            child: productController.filteredProducts.isEmpty
                ? const Center(
                    child: Text('Nothing found.'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 5),
                    // shrinkWrap: true,
                    itemCount: productController.filteredProducts.length,
                    itemBuilder: (context, index) {
                      final item = data[index];

                      return ProductItem(
                        item: item,
                        trailing: showCurrentStock
                            ? CurrentStockQuantity(
                                fontSize: 16,
                                currentStock: item.currentStock,
                              )
                            : Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CurrentStockQuantity(
                                    currentStock: item.safetyQuantity,
                                    withBackground: true,
                                    backGroundColor: item.safetyQuantity == 0
                                        ? const Color(0xFFBDBDBD)
                                        : Colors.green,
                                    fontSize: 16,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  CurrentStockQuantity(
                                    currentStock: item.currentStock,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                        onTap: () {
                          onTap(item);
                        },
                      );
                    },
                  ),
          )
        ],
      );
    });
  }
}
