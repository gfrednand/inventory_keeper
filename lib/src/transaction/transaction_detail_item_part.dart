import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/models/stock/stock.dart';

///
class TransactionDetailItemPart extends StatelessWidget {
  ///
  const TransactionDetailItemPart({
    Key? key,
    required this.quantity,
    required this.label,
    this.labelColor,
  }) : super(key: key);

  ///
  final int quantity;

  ///
  final String label;

  ///
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$quantity',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: labelColor, fontSize: 20),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[400],
          ),
        )
      ],
    );
  }
}
