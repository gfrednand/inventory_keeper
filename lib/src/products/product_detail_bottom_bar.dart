import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/utility/colors.dart';

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
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: [
              quantityWidget,
              const Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.blue600,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.blue700,
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
          ),
        ],
      ),
    );
  }
}
