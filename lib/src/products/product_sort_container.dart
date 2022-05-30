import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/utility/app_constants.dart';
import 'package:inventory_keeper/src/widgets/section_divider.dart';

/// Items In / out container class
class ProductSortContainer extends StatelessWidget {
  ///
  const ProductSortContainer({
    Key? key,
    this.product,
    this.removeCurrentRoute = true,
  }) : super(key: key);

  /// product
  final Product? product;

  ///
  final bool? removeCurrentRoute;

  ///

  /// Context
  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: containerBoxDecoration(),
      child: Column(
        children: [
          ListTile(
            title: const Text('A to Z'),
            trailing: productController.sortEnum == ProductSortEnum.a2z
                ? const Icon(Icons.check)
                : const SizedBox(),
            onTap: () {
              productController.sortProducts(ProductSortEnum.a2z);
              Get.back<void>();
            },
          ),
          const SectionDivider(),
          ListTile(
            title: const Text('Z to A'),
            trailing: productController.sortEnum == ProductSortEnum.z2a
                ? const Icon(Icons.check)
                : const SizedBox(),
            onTap: () {
              productController.sortProducts(ProductSortEnum.z2a);
              Get.back<void>();
            },
          ),
          const SectionDivider(),
          ListTile(
            title: const Text('Largest no. of item'),
            trailing: productController.sortEnum == ProductSortEnum.largeStock
                ? const Icon(Icons.check)
                : const SizedBox(),
            onTap: () {
              productController.sortProducts(ProductSortEnum.largeStock);
              Get.back<void>();
            },
          ),
          const SectionDivider(),
          ListTile(
            title: const Text('Lowest no. of item'),
            trailing: productController.sortEnum == ProductSortEnum.loweStock
                ? const Icon(Icons.check)
                : const SizedBox(),
            onTap: () {
              productController.sortProducts(ProductSortEnum.loweStock);
              Get.back<void>();
            },
          ),
        ],
      ),
    );
  }
}
