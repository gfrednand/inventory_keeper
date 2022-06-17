import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/stock_summary_controller.dart';
import 'package:inventory_keeper/src/models/product/product.dart';
import 'package:inventory_keeper/src/models/product_summary/product_summary.dart';
import 'package:inventory_keeper/src/models/stock_summary/stock_summary.dart';

/// Initial Stck Summary
///
StockSummary initiaStock = const StockSummary(
  teamId: '',
  totalSale: 0,
  productsSummary: [],
  totalAmount: 0,
  totalAuditQuantity: 0,
  totalBuy: 0,
  totalIn: 0,
  totalOut: 0,
  totalQuantity: 0,
  lastUpdatedAt: 0,
);

/// Check if number is integer

bool isInteger(num value) => value is int || value == value.roundToDouble();

/// Convert timestamp to datetime
DateTime? parseTime(dynamic date) {
  return date == null ? null : (date as Timestamp).toDate();
}

/// Get today date without time in millseconds
int dateToMillSeconds(DateTime? date) {
  if (date != null) {
    return DateTime(date.year, date.month, date.day).millisecondsSinceEpoch;
  } else {
    return 0;
  }
}

///Format datetime from epoch milliseconds
String formatedDateSinceEpoch(int date) {
  return DateFormat('MMM d, yyyy')
      .format(DateTime.fromMillisecondsSinceEpoch(date));
}

///Formating date

String dateFormat(DateTime? date, {String format = 'dd/MM/yyy'}) {
  if (date != null) {
    return DateFormat(format).format(date);
  }
  return 'Select';
}

/// Get product with current stock

Product productWithLatestInfo(Product product) {
  ProductSummary? prod;
  final stock = StockSummaryController.instance.stockSummary;
  print(stock?.toJson());
  final usedStock = stock ?? initiaStock;
  prod = usedStock.productsSummary.firstWhereOrNull(
    (item) => item.productId == product.id,
  );
  return product.copyWith(
    currentStock: prod?.currentStock ?? 0,
  );
}

/// Converting product Summary to Product
Product? productSummaryToProduct(
  ProductSummary? productSummary,
) {
  final products = ProductController.instance.products;
  Product? prod;
  prod = products.firstWhereOrNull(
    (item) => item.id == productSummary?.productId,
  );

  return prod?.copyWith(
    currentStock: productSummary?.currentStock ?? 0,
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
void loadDialog<T>({
  String loadingText = 'Loading...',
}) {
  Get.defaultDialog<T>(
    content: Padding(
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
    barrierDismissible: false,
    radius: 50,
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
Future<DateTime?> selectDate(
  BuildContext context, {
  DateTime? firstDate,
  DateTime? lastDate,
  DateTime? currentDate,
}) {
  return showDatePicker(
    context: context,
    initialDate: currentDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime(2015),
    lastDate: lastDate ?? DateTime(2050),
  );
}

/// Out Icon
Transform outIcon({double? size}) {
  return Transform.rotate(
    angle: 180 * math.pi / 180,
    child: Icon(
      Icons.output,
      size: size,
      color: Colors.red,
    ),
  );
}

/// In Icon
Icon inIcon({double? size}) {
  return Icon(
    Icons.input,
    size: size,
    color: Colors.teal,
  );
}

/// Audit Icon
Icon auditIcon({double? size}) {
  return Icon(
    Icons.swap_vert_outlined,
    size: size,
    color: Colors.blue,
  );
}
