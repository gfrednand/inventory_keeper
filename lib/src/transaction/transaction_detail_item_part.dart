import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/utility/colors.dart';

///
class TransactionDetailItemPart extends StatelessWidget {
  ///
  const TransactionDetailItemPart({
    Key? key,
    required this.quantity,
    required this.label,
    this.labelColor = AppColors.blue200,
    this.quantityColor,
  }) : super(key: key);

  ///
  final String quantity;

  ///
  final String label;

  ///
  final Color? labelColor;

  ///
  final Color? quantityColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quantity,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: quantityColor,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: labelColor,
          ),
        )
      ],
    );
  }
}
