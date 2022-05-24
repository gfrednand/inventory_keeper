import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/cart_controller.dart';
import 'package:inventory_keeper/src/homepage/home_item_container.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/stock/stock_in_out_form.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

/// Stock in / out container class
class StockInOutContainer extends StatelessWidget {
  ///
  const StockInOutContainer({
    Key? key,
    this.label,
    this.product,
    required this.ctx,
    this.removeCurrentRoute = true,
  }) : super(key: key);

  /// label
  final String? label;

  /// product
  final Product? product;

  ///
  final bool? removeCurrentRoute;

  /// Context
  final BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return HomeItemContainer(
      label: label ?? 'Stock In/Out',
      child: Column(
        children: [
          ListTile(
            leading: inIcon(),
            title: const Text('Stock In'),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
            ),
            onTap: () {
              onTap(
                ctx,
                true,
                cartController,
                removeCurrentRoute ?? true,
              );
            },
          ),
          const SizedBox(
            height: 4,
          ),
          ListTile(
            leading: outIcon(),
            title: const Text('Stock Out'),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
            ),
            onTap: () {
              onTap(ctx, false, cartController, removeCurrentRoute ?? true);
            },
          ),
        ],
      ),
    );
  }

  /// on tap function
  void onTap(
    BuildContext context,
    bool isStockIn,
    CartController cartController,
    bool removeCurrentRoute,
  ) {
    if (removeCurrentRoute) Navigator.pop(context);
    if (product == null) {
      Get.to<void>(
        () => StockInOutForm(
          isStockIn: isStockIn,
        ),
      );
    } else {
      displayDialog<int>(
        context,
        StockQuantityField(
          productName: product!.name,
          title: isStockIn ? 'Stock in quantity' : 'Stock out quantity',
          currentQuantity: product!.currentStock,
          initialCounter: product!.currentStock,
          isIncrement: isStockIn,
        ),
      ).then((value) {
        if (value != null && value > 0) {
          cartController.addItem(
            amount: isStockIn ? product!.buyPrice : product!.salePrice,
            id: product!.id ?? '',
            name: product!.name,
            selectedQuantity: value,
            currentQuantity: product!.currentStock,
            isIncoming: isStockIn,
          );
          Navigator.pushNamed(
            context,
            StockInOutForm.routeName,
            arguments: {'isStockIn': isStockIn},
          );
        }
      });
    }
  }
}
