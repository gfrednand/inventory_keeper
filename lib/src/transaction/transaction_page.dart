// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';
import 'package:inventory_keeper/src/homepage/stock_in_out_container.dart';
import 'package:inventory_keeper/src/models/stock/stock.dart';
import 'package:inventory_keeper/src/transaction/transaction_details_page.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/custom_appbar.dart';
import 'package:inventory_keeper/src/widgets/modal_sheet.dart';
import 'package:provider/provider.dart';

///
class TransactionPage extends StatelessWidget {
  ///
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stocks = context.watch<List<Stock>?>();
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
            return stocks == null
                ? const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SliverFillRemaining(
                    child: GroupedListView<Stock, String>(
                      elements: stocks,
                      groupBy: (element) => DateFormat('MMM d, yyyy')
                          .format(DateTime.parse(element.createdAt)),
                      groupComparator: (value1, value2) =>
                          value1.compareTo(value2),
                      itemComparator: (item1, item2) =>
                          item1.createdAt.compareTo(item2.createdAt),
                      // order: GroupedListOrder.ASC,
                      useStickyGroupSeparators: true,
                      groupSeparatorBuilder: (String value) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          value,
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      itemBuilder: (c, item) {
                        final total = item.products.length;
                        final sign = item.isIncoming ? '+' : '-';
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              onTap: () {
                                context.read<StockController>().stock = item;
                                Navigator.pushNamed(
                                  context,
                                  TransactionDetailsPage.routeName,
                                );
                              },
                              leading: item.isIncoming ? inIcon() : outIcon(),
                              title: Text(
                                item.isIncoming ? 'Stock In' : 'Stock Out',
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
                  );
          }),
        ],
      ),
    );
  }
}
