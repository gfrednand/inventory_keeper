import 'package:flutter/material.dart';

import 'package:inventory_keeper/src/utility/app_constants.dart';

/// Stock in / out container class
class HomeItemContainer extends StatelessWidget {
  ///
  const HomeItemContainer({
    Key? key,
    required this.child,
    required this.label,
    this.withGradient = false,
  }) : super(key: key);

  /// child
  final Widget child;

  /// label
  final String label;

  /// With gradient
  final bool withGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration:
          withGradient ? decorationWithGradient() : containerBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: withGradient ? Colors.white : Colors.black,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
