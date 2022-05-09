import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/models/stock.dart';

///
class TransactionDetailItemPart extends StatelessWidget {
  ///
  const TransactionDetailItemPart({
    Key? key,
    required this.quantity,
    required this.label,
  }) : super(key: key);

  ///
  final int quantity;

  ///
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$quantity',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
