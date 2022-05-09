import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/models/stock.dart';
import 'package:provider/provider.dart';

///
class TransactionPage extends StatelessWidget {
  ///
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stocks = context.watch<List<Stock>?>();
    print('Stocks.. ${stocks?.length}');
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).canvasColor,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Transactions',
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: (stocks?.length ?? 0) > 0
          ? ListView.separated(
              // Providing a restorationId allows the ListView to restore the
              // scroll position when a user leaves and returns to the app after
              // it has been killed while running in the background.
              restorationId: 'transactionView',
              itemCount: stocks?.length ?? 0,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                final item = stocks![index];
                return Text('${item.currentStock}');
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
