import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/cart_controller.dart';
import 'package:inventory_keeper/src/controllers/partner_controller.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_transaction_controller.dart';
import 'package:inventory_keeper/src/models/partner/partner.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
import 'package:inventory_keeper/src/partner/partner_list_view.dart';
import 'package:inventory_keeper/src/products/product_details.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/stock/stock_in_out_items.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/section_divider.dart';

///
class AddPastTransaction extends StatelessWidget {
  ///
  const AddPastTransaction({Key? key, required this.transactionType})
      : super(key: key);

  ///
  final TransactionType transactionType;

  ///
  static const routeName = '/addPastTransaction';
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final transactionController = ProductTransactionController.instance;
    final partnerController = Get.put(PartnerController());

    var titleLabel = '';
    Color? color;
    String? partnerLabel;
    PartnerType? partnerType;

    if (transactionType == TransactionType.inStock) {
      titleLabel = 'Items In';
      partnerLabel = 'Supplier';
      partnerType = PartnerType.supplier;
      color = Colors.teal;
    } else if (transactionType == TransactionType.outStock) {
      titleLabel = 'Items Out';
      partnerLabel = 'Vendor';
      partnerType = PartnerType.vendor;
      color = Colors.red;
    }
    return WillPopScope(
      onWillPop: () => _onBackPressed(context, cartController, titleLabel)
          .then((value) => value ?? false),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).canvasColor,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
            onPressed: () => _onBackPressed(context, cartController, titleLabel)
                .then((value) {
              if (value ?? false) {
                Navigator.pop(context);
              }
            }),
            icon: const Icon(Icons.close),
          ),
          title: const Text('Add Past Transaction'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          titleLabel,
                          style: TextStyle(
                            color: color,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SectionDivider(
                        color: color,
                      ),
                      GetBuilder<ProductTransactionController>(builder: (cont) {
                        final dateLabel = dateFormat(
                            transactionController.pastTransactionDate);
                        return ListTile(
                          title: const Text('Date'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(dateLabel),
                              const SizedBox(
                                width: 16,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              )
                            ],
                          ),
                          onTap: () {
                            selectDate(context, lastDate: DateTime.now()).then(
                              (value) => transactionController
                                  .pastTransactionDate = value,
                            );
                          },
                        );
                      }),
                      const SectionDivider(),
                      if (partnerLabel != null)
                        GetBuilder<PartnerController>(builder: (cont) {
                          var selectedPartnerLabel = 'Select';
                          if (partnerController.partner != null) {
                            selectedPartnerLabel =
                                '${partnerController.partner?.name}';
                          }
                          return ListTile(
                            title: Text(partnerLabel!),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(selectedPartnerLabel),
                                const SizedBox(
                                  width: 16,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                )
                              ],
                            ),
                            onTap: () {
                              Get.to<void>(
                                () => PartnerListView(
                                  type: partnerType!,
                                ),
                              );
                            },
                          );
                        }),
                      if (partnerLabel != null) const SectionDivider(),
                      ListTile(
                        title: const Text('Item'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${cartController.itemCount} Items'),
                            const SizedBox(
                              width: 16,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            )
                          ],
                        ),
                        onTap: () {
                          Get.to<void>(
                            () => StockInOutItems(
                              transactionType: transactionType,
                            ),
                          );
                        },
                      ),
                      const SectionDivider(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          itemCount: cartController.itemCount,
                          itemBuilder: (context, index) {
                            final cartProducts =
                                cartController.items.values.toList();
                            var selectedQuantity = cartController.totalQuantity;
                            if (transactionType == TransactionType.inStock) {
                              selectedQuantity = selectedQuantity;
                            } else if (transactionType ==
                                TransactionType.outStock) {
                              selectedQuantity = selectedQuantity * -1;
                            }

                            final prod = ProductController.instance.products
                                .firstWhereOrNull(
                              (element) => element.id == cartProducts[index].id,
                            );
                            return ProductItem(
                              item: prod!,
                              trailing: Text(
                                '${cartProducts[index].quantity}',
                                style: TextStyle(color: color),
                              ),
                              onTap: () {
                                Get.to<void>(
                                  () => const ProductDetails(
                                    showTransactionButton: false,
                                  ),
                                  arguments: prod,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.blue700,
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                      left: 14,
                      right: 24,
                    ),
                  ),
                  onPressed: () async {
                    if (cartController.items.isEmpty) {
                      Get.snackbar(
                        'Heey',
                        'Add at least one item first',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else if (cartController.items.isEmpty) {
                      Get.snackbar(
                        'Heey',
                        'Transaction date is missing',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      if (cartController.items.isNotEmpty) {
                        await transactionController.addTransaction(
                            cartController: cartController,
                            transactionType: transactionType,
                            transactionDate:
                                transactionController.pastTransactionDate);
                      }
                    }
                  },
                  child: const Text('Save'),
                ))
          ],
        ),
      ),
    );
  }

  ///
  Future<bool?> _onBackPressed(
    BuildContext context,
    CartController cartController,
    String transactionType,
  ) {
    if (cartController.items.isEmpty) {
      return Future.value(true);
    } else {
      // set up the buttons
      final cancelButton = ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.blue700,
        ),
        child: const Text(
          'Cancel',
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      );
      final continueButton = TextButton(
        child: const Text(
          'Delete',
          style: TextStyle(color: Colors.red),
        ),
        onPressed: () {
          Get.back<void>();
          cartController.clear();
          Get.back<void>();
        },
      );
      // set up the AlertDialog
      final alert = AlertDialog(
        title: Text('Quit $transactionType'),
        content: const Text('Delete Draft?'),
        actions: [
          cancelButton,
          continueButton,
        ],
      );
      // show the dialog
      return showDialog<bool>(
        context: context,
        builder: (BuildContext context) => alert,
      );
    }
  }
}
