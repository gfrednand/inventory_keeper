import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/cart_controller.dart';
import 'package:inventory_keeper/src/homepage/home_item_container.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
import 'package:inventory_keeper/src/stock/stock_in_out_form.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

/// Items In / out container class
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

  ///
  static Product? modifiedProduct;

  /// Context
  final BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    // final transactionController = Get.find<TransactionController>();
    // final currentStock = transactionController.getTransactionSummary();

    return HomeItemContainer(
      label: label ?? 'Items In/Out',
      child: Column(
        children: [
          ListTile(
            leading: inIcon(),
            title: const Text('Items In'),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
            ),
            onTap: () {
              onTap(
                ctx,
                TransactionType.inStock,
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
            title: const Text('Items Out'),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
            ),
            onTap: () {
              onTap(
                ctx,
                TransactionType.outStock,
                cartController,
                removeCurrentRoute ?? true,
              );
            },
          ),
          const SizedBox(
            height: 4,
          ),
          ListTile(
            leading: auditIcon(),
            title: const Text('Audit'),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
            ),
            onTap: () {
              onTap(
                ctx,
                TransactionType.audit,
                cartController,
                removeCurrentRoute ?? true,
              );
            },
          ),
        ],
      ),
    );
  }

  /// on tap function
  void onTap(
    BuildContext context,
    TransactionType transactionType,
    CartController cartController,
    bool removeCurrentRoute,
  ) {
    if (removeCurrentRoute) Navigator.pop(context);
    if (modifiedProduct == null) {
      Get.to<void>(
        () => StockInOutForm(
          transactionType: transactionType,
        ),
      );
    } else {
      displayDialog<Map<String, int?>>(
        context,
        StockQuantityField(
          productName: modifiedProduct!.name,
          title: transactionType == TransactionType.outStock
              ? 'Items Out quantity'
              : transactionType != TransactionType.inStock
                  ? 'Items In quantity'
                  : transactionType == TransactionType.audit
                      ? 'Audit Quantity'
                      : '',
          currentStock: modifiedProduct!.currentStock,
          initialCounter: modifiedProduct!.currentStock,
          transactionType: transactionType,
        ),
      ).then((map) {
        if (map != null) {
          var currentStock = 0;
          var quantity = map['quantity'];
          final auditedQuantity = map['auditedQuantity'];

          if (transactionType != TransactionType.inStock) {
            currentStock =
                (modifiedProduct?.currentStock ?? 0) + (quantity ?? 0);
          } else if (transactionType != TransactionType.outStock) {
            quantity = -1 * (quantity ?? 0);
            currentStock = (modifiedProduct?.currentStock ?? 0) - quantity;
          } else if (transactionType != TransactionType.audit) {
            currentStock = quantity ?? 0;
          }
          cartController.addItem(
            amount: transactionType == TransactionType.inStock
                ? modifiedProduct?.buyPrice
                : transactionType == TransactionType.outStock
                    ? modifiedProduct?.salePrice
                    : 0,
            id: modifiedProduct!.id ?? '',
            name: modifiedProduct!.name,
            quantity: quantity,
            auditedQuantity: auditedQuantity,
            currentStock: currentStock,
          );

          Get.to<void>(
            () => StockInOutForm(
              transactionType: transactionType,
            ),
            transition: Transition.topLevel,
          );
        }
      });
    }
  }
}
