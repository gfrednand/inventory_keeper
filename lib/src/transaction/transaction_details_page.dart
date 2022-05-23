import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';
import 'package:inventory_keeper/src/transaction/transaction_detail_item_part.dart';
import 'package:inventory_keeper/src/widgets/app_delete_menu.dart';
import 'package:inventory_keeper/src/widgets/section_divider.dart';

///
class TransactionDetailsPage extends StatelessWidget {
  ///
  const TransactionDetailsPage({
    Key? key,
  }) : super(key: key);

  /// Transaction history
  static const routeName = '/transactionDetailsPage';

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StockController>();
    final transaction = controller.transaction;
    if (transaction != null) {
      final formatter = DateFormat(' MMM d, yyyy h:mm a');
      final titleLabel = transaction.isIncoming ? 'Stock In' : 'Stock Out';
      final color = transaction.isIncoming ? Colors.teal : Colors.red;
      final sign = transaction.isIncoming ? '+' : '-';
      final totalItems = transaction.productsSummary.length;
      return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Theme.of(context).canvasColor,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'History',
          ),
          actions: [
            IconButton(
              onPressed: () {
                AppDeleteMenu().show(context, () {
                  controller.removeStock().then((success) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
                });
              },
              icon: const Icon(Icons.more_horiz_rounded),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formatter.format(transaction.createdAt),
                style: TextStyle(color: Colors.grey[400]),
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TransactionDetailItemPart(
                    quantity: transaction.productsSummary.length,
                    label: totalItems > 1 ? 'Items' : 'Item',
                  ),
                  TransactionDetailItemPart(
                    quantity: transaction.totalSelectedQuantity,
                    label: 'Quantity',
                  ),
                ],
              ),
              const SectionDivider(),
              ListView.separated(
                shrinkWrap: true,
                itemCount: transaction.productsSummary.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SectionDivider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(transaction.productsSummary[index].name),
                  );

                  // ProductItem(
                  //   item: transaction.productsSummary[index],
                  //   trailing: Text(
                  //     '$sign${transaction.productsSummary[index].selectedQuantity}',
                  //     style: TextStyle(color: color),
                  //   ),
                  // );
                },
              )
            ],
          )),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
    );
  }
}
