import 'package:flutter/material.dart';

///
class CurrentStockQuantity extends StatelessWidget {
  ///
  const CurrentStockQuantity({
    Key? key,
    this.withBackground = false,
    this.currentStock = 0,
  }) : super(key: key);

  ///
  final bool withBackground;

  ///
  final int currentStock;
  @override
  Widget build(BuildContext context) {
    final color = currentStock > -1 ? Colors.teal : Colors.red;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: withBackground ? color : null,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          '$currentStock',
          style: TextStyle(
            color: withBackground ? Colors.white : color,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
