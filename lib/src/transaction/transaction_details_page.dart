import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/models/stock.dart';
import 'package:inventory_keeper/src/products/product_item.dart';
import 'package:inventory_keeper/src/transaction/transaction_detail_item_part.dart';

///
class TransactionDetailsPage extends StatelessWidget {
  ///
  const TransactionDetailsPage({Key? key, required this.stock})
      : super(key: key);

  ///
  final Stock stock;

  /// Transaction history
  static const routeName = '/transactionDetailsPage';

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatter.format(stock.createdAt),
              style: const TextStyle(color: Colors.grey),
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
            Divider(
              color: color,
              thickness: 2,
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
            const Divider(),
            ListView.separated(
              shrinkWrap: true,
              itemCount: stock.products.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
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
}
