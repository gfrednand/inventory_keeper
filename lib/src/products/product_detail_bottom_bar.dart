import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/utility/app_constants.dart';

///
class ProductDetailBottomBar extends StatelessWidget {
  ///
  const ProductDetailBottomBar({
    Key? key,
    required this.onPressed,
    required this.buttonLabel,
    required this.quantityWidget,
  }) : super(key: key);

  ///
  final void Function()? onPressed;

  ///
  final String buttonLabel;

  ///
  final Widget quantityWidget;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                quantityWidget,
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'Quantity',
                  style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                  left: 14,
                  right: 24,
                ),
              ),
              onPressed: onPressed,
              child: Text(buttonLabel),
            ),
          ],
        ),
      ),
    );
  }
}
