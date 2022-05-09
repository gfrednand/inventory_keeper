// ignore_for_file: cascade_invocations

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/models/stock.dart';
import 'package:inventory_keeper/src/transaction/transaction_details_page.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:provider/provider.dart';

///
class TransactionPage extends StatelessWidget {
  ///
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stocks = context.watch<List<Stock>?>();

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
          'Transactions',
          // style: TextStyle(fontSize: 28),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showStockInOutMenu(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: stocks == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : stocks.isNotEmpty
              ? Builder(
                  builder: (context) {
                    Widget widget = Column();
                    final formatter = DateFormat(' MMM d, yyyy');
                    final groupByDate = groupBy<Stock, String>(
                      stocks,
                      (obj) => formatter.format(obj.createdAt),
                    );
                    groupByDate.forEach((date, list) {
                      widget = Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              date,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Expanded(
                              child: ListView.separated(
                                // Providing a restorationId allows the ListView to restore the
                                // scroll position when a user leaves and returns to the app after
                                // it has been killed while running in the background.
                                restorationId: 'transactionView',
                                itemCount: list.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(),
                                itemBuilder: (BuildContext context, int index) {
                                  final item = list[index];
                                  final total = item.products.length;
                                  final sign = item.isIncoming ? '+' : '-';
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            TransactionDetailsPage.routeName,
                                            arguments: {'stock': item},
                                          );
                                        },
                                        leading: item.isIncoming
                                            ? const Icon(
                                                Icons.inbox_outlined,
                                                color: Colors.green,
                                              )
                                            : const Icon(
                                                Icons.outbox_outlined,
                                                color: Colors.red,
                                              ),
                                        title: Text(
                                          item.isIncoming
                                              ? 'Stock In'
                                              : 'Stock Out',
                                        ),
                                        subtitle: Text(
                                          '$total Item${total > 1 ? 's' : ''}',
                                        ),
                                        trailing: Text(
                                          '$sign${item.totalSelectedQuantity}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: item.isIncoming
                                                ? Colors.green
                                                : Colors.red,
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
                            )
                          ],
                        ),
                      );
                      // day section divider
                    });

                    return widget;
                  },
                )
              : const Center(
                  child: Text(
                    'No Data',
                    style: TextStyle(fontSize: 32),
                  ),
                ),
    );
  }
}
