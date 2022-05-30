import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/products/add_product.dart';
import 'package:inventory_keeper/src/widgets/modal_sheet.dart';

///Delete menu class
class AppDeleteMenu {
  /// Show delete menu
  void show(
    BuildContext context,
    ProductController productController,
  ) {
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
              onPressed: () {
                Get.back<void>();
                // ignore: cascade_invocations
                Get.to<void>(
                  () => AddProduct(
                    addProductEnum: AddProductEnum.add,
                    product: productController.product,
                  ),
                );
              },
              child: const Text(
                'Copy',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Divider(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _delete(context, productController.removeProduct);
              },
              child: const Text(
                'Delete',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _delete(BuildContext context, void Function()? onPressed) {
    showDialog<void>(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Please Confirm'),
          content: const Text('Are you sure to delete?'),
          actions: [
            // The "Yes" button
            TextButton(
              onPressed: onPressed,
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            )
          ],
        );
      },
    );
  }
}
