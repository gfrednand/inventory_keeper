// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';
import 'package:inventory_keeper/src/homepage/stock_in_out_container.dart';
import 'package:inventory_keeper/src/transaction/transaction_details_page.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/custom_appbar.dart';
import 'package:inventory_keeper/src/widgets/modal_sheet.dart';

///
class TransactionPage extends StatelessWidget {
  ///
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                      title: const Text(
                        'Select',
                        style: TextStyle(fontSize: 20),
                      ),
                      ctx: context,
                    ),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.black),
              )
            ],
          ),
          Builder(builder: (context) {
            final stockController = Get.find<StockController>();
            final stocks = stockController.stocks;
            return stocks == null
                ? const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SliverFillRemaining(
                    child: ListView.builder(
                        itemCount: stocks.length,
                        itemBuilder: (context, index) {
                          var stock = stocks[index];
                          return Column(
                            children: [
                              Text(
                                stock.createdAt,
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              ListView.builder(
                                  itemCount: stock.transactions.length,
                                  itemBuilder: (context, index) {
                                    var item = stock.transactions[index];
                                    final total = item.productsSummary.length;
                                    final sign = item.isIncoming ? '+' : '-';
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            stockController.transaction = item;
                                            Navigator.pushNamed(
                                              context,
                                              TransactionDetailsPage.routeName,
                                            );
                                          },
                                          leading: item.isIncoming
                                              ? inIcon()
                                              : outIcon(),
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
                                  })
                            ],
                          );
                        }));
          }),
        ],
      ),
    );
  }
}
