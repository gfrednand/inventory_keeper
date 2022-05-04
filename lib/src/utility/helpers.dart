import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

/// Check if number is integer

bool isInteger(num value) => value is int || value == value.roundToDouble();

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
