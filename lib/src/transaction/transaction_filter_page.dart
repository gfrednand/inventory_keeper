import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/transaction_controller.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

///
class TransactionFilterPage extends StatelessWidget {
  ///
  const TransactionFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionController = Get.find<TransactionController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        title: const Text(
          'Filter',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          TextButton(
            onPressed: () {
              transactionController.clearAllFilters();
              Get.back<void>();
            },
            child: const Text('Clear'),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getFilterTitle('Stock', transactionController),
            getChipFilter(transactionController),
            const Divider(thickness: 0.3),
            getFilterTitle('Date', transactionController, showSwitch: true),
            getDateRangePicker(context, transactionController),
            const Divider(thickness: 0.3),
            getFilterTitle('Item', transactionController, showSwitch: true),
            const ListTile(
              title: Text('All'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            const Divider(thickness: 0.3),
            getFilterTitle('Partner', transactionController, showSwitch: true),
            const ListTile(
              title: Text('All'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,

                // padding:
                //     const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Apply',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///
  Widget getChipFilter(TransactionController transactionController) {
    return GetBuilder<TransactionController>(
      builder: (cont) {
        final chips = [
          FilterChip(
            label: const Text('All'),
            selected: transactionController.transactionFilterType ==
                TransactionType.all,
            selectedColor: AppColors.blue200,
            checkmarkColor: AppColors.blue600,
            onSelected: (value) {
              transactionController.transactionFilterType = TransactionType.all;
            },
          ),
          FilterChip(
            label: const Text('In'),
            selected: transactionController.transactionFilterType ==
                TransactionType.inStock,
            selectedColor: AppColors.blue200,
            checkmarkColor: AppColors.blue600,
            onSelected: (value) {
              transactionController.transactionFilterType =
                  TransactionType.inStock;
            },
          ),
          FilterChip(
            label: const Text('Out'),
            selected: transactionController.transactionFilterType ==
                TransactionType.outStock,
            selectedColor: AppColors.blue200,
            checkmarkColor: AppColors.blue600,
            onSelected: (value) {
              transactionController.transactionFilterType =
                  TransactionType.outStock;
            },
          ),
          FilterChip(
            label: const Text('Audit'),
            selected: transactionController.transactionFilterType ==
                TransactionType.audit,
            selectedColor: AppColors.blue200,
            checkmarkColor: AppColors.blue600,
            onSelected: (value) {
              transactionController.transactionFilterType =
                  TransactionType.audit;
            },
          )
        ];

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final chip in chips)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                child: chip,
              )
          ],
        );
      },
    );
  }

  ///Filter title
  Widget getFilterTitle(
    String title,
    TransactionController transactionController, {
    bool showSwitch = false,
  }) {
    return GetBuilder<TransactionController>(
      builder: (cont) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              if (showSwitch)
                Switch(
                  activeColor: AppColors.blue200,
                  value: false,
                  onChanged: (value) {},
                )
              else
                Container(),
            ],
          ),
        );
      },
    );
  }

  /// Date range picker
  Widget getDateRangePicker(
    BuildContext context,
    TransactionController transactionController,
  ) {
    return GetBuilder<TransactionController>(
      builder: (cont) {
        return SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Card(
                  child: ListTile(
                    title: Text(
                      dateFormat(
                        transactionController.transactionFilterStartDate,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_downward,
                      size: 20,
                    ),
                    onTap: () {
                      selectDate(context).then((value) {
                        if (value != null) {
                          transactionController.transactionFilterStartDate =
                              value;
                          // ignore: cascade_invocations
                          transactionController.transactionFilterEndDate ??=
                              value;
                        }
                      });
                    },
                  ),
                ),
              ),
              const Text('-'),
              Expanded(
                child: Card(
                  child: ListTile(
                    title: Text(
                      dateFormat(
                        transactionController.transactionFilterEndDate,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_downward,
                      size: 20,
                    ),
                    onTap: () {
                      selectDate(context).then((value) {
                        if (value != null) {
                          transactionController.transactionFilterEndDate =
                              value;
                          // ignore: cascade_invocations
                          transactionController.transactionFilterStartDate ??=
                              value;
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
