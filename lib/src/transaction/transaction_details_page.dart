import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/transaction/transaction_detail_item_part.dart';
import 'package:inventory_keeper/src/widgets/app_delete_menu.dart';
import 'package:inventory_keeper/src/widgets/section_divider.dart';
import 'package:provider/provider.dart';

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
    final controller = context.watch<StockController>();
    final stock = controller.stock;
    if (stock != null) {
      final formatter = DateFormat(' MMM d, yyyy h:mm a');
      final titleLabel = stock.isIncoming ? 'Stock In' : 'Stock Out';
      final color = stock.isIncoming ? Colors.teal : Colors.red;
      final sign = stock.isIncoming ? '+' : '-';
      final totalItems = stock.products.length;
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
                formatter.format(DateTime.parse(stock.createdAt)),
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
                    quantity: stock.products.length,
                    label: totalItems > 1 ? 'Items' : 'Item',
                  ),
                  TransactionDetailItemPart(
                    quantity: stock.totalSelectedQuantity,
                    label: 'Quantity',
                  ),
                ],
              ),
              const SectionDivider(),
              ListView.separated(
                shrinkWrap: true,
                itemCount: stock.products.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SectionDivider(),
                itemBuilder: (context, index) {
                  return ProductItem(
                    item: stock.products[index],
                    trailing: Text(
                      '$sign${stock.products[index].selectedQuantity}',
                      style: TextStyle(color: color),
                    ),
                  );
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
