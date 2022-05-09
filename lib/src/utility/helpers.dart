import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/stock/stock_in_out_form.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:inventory_keeper/src/widgets/modal_sheet.dart';
import 'package:provider/provider.dart';

/// Check if number is integer

bool isInteger(int value) => value is int || value == value.roundToDouble();

/// Convert timestamp to datetime
DateTime? parseTime(dynamic date) {
  return date == null ? null : (date as Timestamp).toDate();
}

final oCcy = NumberFormat.currency(
  locale: 'en_TZ',
  customPattern: '#,### \u00a4',
  symbol: 'TSh',
  decimalDigits: 0,
);

/// Showing loading dialog
Future loadDialog<T>(
  BuildContext context, {
  String loadingText = 'Loading...',
}) {
  return showDialog<T>(
    barrierDismissible: false,
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                height: 15,
              ),
              Text(loadingText),
            ],
          ),
        ),
      );
    },
  );
}

///
void showStockInOutMenu(BuildContext context) {
  final controller = context.read<ProductController>();
  CustomModalSheet.show(
    isExpanded: false,
    context: context,
    child: Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            leading: const Icon(
              Icons.inbox_outlined,
              color: Colors.green,
            ),
            title: const Text('Stock In'),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
            ),
            onTap: () {
              onTap(context, controller.product, true);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.outbox_outlined,
              color: Colors.red,
            ),
            title: const Text('Stock Out'),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
            ),
            onTap: () {
              onTap(context, controller.product, false);
            },
          ),
        ],
      ),
    ),
  );
}

///
void onTap(BuildContext context, Product? product, bool isStockIn) {
  print('OKOKOK ${product?.toMap()}');
  Navigator.pop(context);
  if (product == null) {
    Navigator.pushNamed(
      context,
      StockInOutForm.routeName,
      arguments: {'isStockIn': isStockIn},
    );
  } else {
    displayDialog<int>(
      context,
      StockQuantityField(
        productName: product.name,
        title: isStockIn ? 'Stock in quantity' : 'Stock out quantity',
        currentQuantity: product.currentStock,
        initialCounter: product.currentStock,
      ),
    ).then((value) {
      if (value != null && value > 0) {
        context.read<StockController>().addToCart(product.copyWith(
              selectedQuantity: value,
              isIncomingStock: true,
              currentStock: value + (product.currentStock),
            ));
        Navigator.pushNamed(
          context,
          StockInOutForm.routeName,
          arguments: {'isStockIn': isStockIn},
        );
      }
    });
  }
}

///
Future<T?> displayDialog<T>(
  BuildContext context,
  Widget? child,
) async =>
    showDialog<T>(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: child,
        );
      },
    );
