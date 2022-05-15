import 'package:flutter/material.dart';

///
class CurrentStockQuantity extends StatelessWidget {
  ///
  const CurrentStockQuantity({
    Key? key,
    this.withBackground = false,
    this.currentStock = 0,
    this.fontSize,
    this.backGroundColor = Colors.teal,
    this.checkCurrentStock = true,
  }) : super(key: key);

  ///
  final bool withBackground;

  ///
  final int currentStock;

  ///
  final Color backGroundColor;

  ///
  final double? fontSize;

  ///
  final bool checkCurrentStock;
  @override
  Widget build(BuildContext context) {
    final color = currentStock > -1 ? backGroundColor : Colors.red;

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
            color: withBackground
                ? Colors.white
                : checkCurrentStock && currentStock == 0
                    ? const Color.fromARGB(176, 158, 158, 158)
                    : color,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
