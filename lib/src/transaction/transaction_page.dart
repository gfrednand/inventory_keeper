// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:inventory_keeper/src/controllers/transaction_controller.dart';
import 'package:inventory_keeper/src/homepage/stock_in_out_container.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
import 'package:inventory_keeper/src/transaction/transaction_details_page.dart';
import 'package:inventory_keeper/src/transaction/transaction_filter_page.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/custom_appbar.dart';
import 'package:inventory_keeper/src/widgets/modal_sheet.dart';

///
class TransactionPage extends StatelessWidget {
  ///
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionController = Get.find<TransactionController>();

    if (transactionController.productTransactions.isEmpty) {
      transactionController.previousTransactionSummary();
    }
    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          CustomAppBar(
            flexibleSpace: const FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(8),
              title: Text(
                'Transactions',
                style: TextStyle(color: Colors.black, fontSize: 28),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  CustomModalSheet.show(
                    isExpanded: false,
                    context: context,
                    child: StockInOutContainer(
                      label: 'Select',
                      ctx: context,
                    ),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.black),
              ),
              IconButton(
                onPressed: () {
                  Get.to<void>(
                    () => const TransactionFilterPage(),
                    transition: Transition.fadeIn,
                  );
                },
                icon: const Icon(Icons.filter_list, color: Colors.black),
              )
            ],
          ),
          Builder(
            builder: (context) {
              final productTransaction = Get.find<TransactionController>();
              final transactions = productTransaction.productTransactions;
              if (transactions.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text('No Transactions'),
                  ),
                );
              }
              return SliverFillRemaining(
                child: GroupedListView<ProductTransaction, String>(
                  elements: transactions,
                  groupBy: (transaction) =>
                      formatedDateSinceEpoch(transaction.transactionDate),
                  groupComparator: (value1, value2) => value1.compareTo(value2),
                  itemComparator: (item1, item2) =>
                      item1.transactionDate.compareTo(item2.transactionDate),
                  // order: GroupedListOrder.ASC,
                  useStickyGroupSeparators: true,
                  groupSeparatorBuilder: (String value) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  itemBuilder: (c, item) {
                    final total = item.productsSummary.length;

                    Widget? icon;
                    String? titleLabel;
                    Color? color;
                    if (item.transactionType == TransactionType.inStock) {
                      titleLabel = 'Items In';
                      icon = inIcon(size: 20);
                      color = Colors.teal;
                    } else if (item.transactionType ==
                        TransactionType.outStock) {
                      titleLabel = 'Items Out';
                      icon = outIcon(size: 20);
                      color = Colors.red;
                    } else if (item.transactionType == TransactionType.audit) {
                      titleLabel = 'Audit';
                      icon = auditIcon(size: 20);
                      color = Colors.blue;
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          onTap: () {
                            Get.to<void>(
                              () => TransactionDetailsPage(
                                transaction: item,
                              ),
                            );
                          },
                          // contentPadding:const EdgeInsets.symmetric(horizontal:8),
                          horizontalTitleGap: 0,
                          leading: icon,
                          title: Text(
                            '$titleLabel',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          subtitle: Text(
                            '$total Item${total > 1 ? 's' : ''}',
                          ),
                          trailing: Text(
                            '${item.totalQuantity}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: color,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
