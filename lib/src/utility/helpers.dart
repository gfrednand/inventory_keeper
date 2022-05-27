import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_summary/product_summary.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
import 'package:inventory_keeper/src/models/stock/stock.dart';

/// Check if number is integer

bool isInteger(int value) => value is int || value == value.roundToDouble();

/// Convert timestamp to datetime
DateTime? parseTime(dynamic date) {
  return date == null ? null : (date as Timestamp).toDate();
}

/// GEt today date without time in millseconds
int dateToMillSeconds(DateTime? date) {
  if (date != null) {
    return DateTime(date.year, date.month, date.day).millisecondsSinceEpoch;
  } else {
    return 0;
  }
}

/// Get product with current stock

Product productWithLatestInfo(Product product, ProductTransaction transaction) {
  ProductSummary? prod;
  prod = transaction.productsSummary.firstWhereOrNull(
    (item) => item.id == product.id,
  );

  return product.copyWith(
    currentStock: prod?.currentStock ?? 0,
    selectedQuantity: prod?.quantity,
  );
}

///
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

///

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

/// Date picker
Future<DateTime?> selectDate(BuildContext context, {DateTime? currentDate}) {
  return showDatePicker(
    context: context,
    initialDate: currentDate ?? DateTime.now(),
    firstDate: DateTime(2015),
    lastDate: DateTime(2050),
  );
}

/// Out Icon
Transform outIcon() {
  return Transform.rotate(
    angle: 180 * math.pi / 180,
    child: const Icon(
      Icons.output,
      color: Colors.red,
    ),
  );
}

/// In Icon
Icon inIcon() {
  return const Icon(
    Icons.input,
    color: Colors.teal,
  );
}
