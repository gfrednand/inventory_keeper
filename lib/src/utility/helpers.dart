import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
