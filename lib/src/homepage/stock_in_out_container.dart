import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';
import 'package:inventory_keeper/src/homepage/home_item_container.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/stock/stock_in_out_form.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:provider/provider.dart';

/// Stock in / out container class
class StockInOutContainer extends StatelessWidget {
  ///
  const StockInOutContainer({
    Key? key,
    required this.title,
    required this.ctx,
    this.removeCurrentRoute = true,
  }) : super(key: key);

  /// Title
  final Widget title;

  ///
  final bool? removeCurrentRoute;

  /// Context
  final BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    final productController = context.watch<ProductController>();
    final stockController = context.watch<StockController>();
    return HomeItemContainer(
      label: 'Stock In/Out',
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
                productController.product,
                true,
                stockController,
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
              onTap(ctx, productController.product, false, stockController,
                  removeCurrentRoute ?? true);
            },
          ),
        ],
      ),
    );
  }

  /// on tap function
  void onTap(
    BuildContext context,
    Product? product,
    bool isStockIn,
    StockController stockController,
    bool removeCurrentRoute,
  ) {
    if (removeCurrentRoute) Navigator.pop(context);
    if (product == null) {
      Navigator.pushNamed(
        context,
        StockInOutForm.routeName,
        arguments: {'isStockIn': isStockIn},
      );
    } else {
      displayDialog<int>(
        context,
        StockQuantityField(
          productName: product.name,
          title: isStockIn ? 'Stock in quantity' : 'Stock out quantity',
          currentQuantity: product.currentStock,
          initialCounter: product.currentStock,
          isIncrement: isStockIn,
        ),
      ).then((value) {
        if (value != null && value > 0) {
          stockController.addToCart(
            product.copyWith(
              selectedQuantity: value,
              isIncomingStock: isStockIn,
              currentStock: isStockIn
                  ? product.currentStock + value
                  : product.currentStock - value,
            ),
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
