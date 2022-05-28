import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
import 'package:inventory_keeper/src/transaction/transaction_detail_item_part.dart';
import 'package:inventory_keeper/src/utility/app_constants.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';
import 'package:inventory_keeper/src/widgets/app_delete_menu.dart';
import 'package:inventory_keeper/src/widgets/section_divider.dart';

///
class TransactionDetailsPage extends StatelessWidget {
  ///
  const TransactionDetailsPage({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  /// Transaction model/definition
  final ProductTransaction transaction;

  /// Transaction route name
  static const routeName = '/transactionDetailsPage';

  @override
  Widget build(BuildContext context) {
    final totalItems = transaction.productsSummary.length;

    var titleLabel = 'Audit';
    Color? color;
    if (transaction.transactionType == TransactionType.inStock) {
      titleLabel = 'Items In';
      color = Colors.blue;
    } else if (transaction.transactionType == TransactionType.outStock) {
      titleLabel = 'Items Out';
      color = Colors.red;
    } else if (transaction.transactionType == TransactionType.audit) {
      titleLabel = 'Audit';
      color = Colors.teal;
    }

    final summaryDate = transaction.productsSummary[0].summaryDate ??
        DateTime(transaction.transactionDate);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
                // transactionController.removeStock().then((success) {
                //   Navigator.pop(context);
                //   Navigator.pop(context);
                // });
              });
            },
            icon: const Icon(Icons.more_horiz_rounded),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                DateFormat('MMM d, yyyy - kk:mm').format(summaryDate),
                style:
                    const TextStyle(color: AppColors.greyLabel, fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titleLabel,
                    style: TextStyle(
                      color: color,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    oCcy.format(transaction.totalAmount),
                    style: TextStyle(
                      color: color,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SectionDivider(
                color: color,
                thickness: 1.1,
              ),
              Container(
                decoration: containerBoxDecoration(),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TransactionDetailItemPart(
                        quantityColor: AppColors.blue300,
                        labelColor: AppColors.blue600,
                        quantity: '${transaction.productsSummary.length}',
                        label: totalItems > 1 ? 'Items' : 'Item',
                      ),
                      const VerticalDivider(
                        thickness: 2,
                        color: AppColors.blue100,
                      ),
                      TransactionDetailItemPart(
                        quantityColor: AppColors.blue300,
                        labelColor: AppColors.blue600,
                        quantity: '${transaction.totalQuantity}',
                        label: 'Quantity',
                      ),
                    ],
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: transaction.productsSummary.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SectionDivider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    title: Text(
                      transaction.productsSummary[index].name,
                      style: const TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      oCcy.format(transaction.productsSummary[index].amount),
                    ),
                    trailing: Text(
                      '${transaction.productsSummary[index].quantity}',
                      style: TextStyle(color: color),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
