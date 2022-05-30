import 'package:flutter/material.dart';

import 'package:inventory_keeper/src/utility/app_constants.dart';

/// Items In / out container class
class HomeItemContainer extends StatelessWidget {
  ///
  const HomeItemContainer({
    Key? key,
    required this.child,
    this.label,
    this.withGradient = false,
    this.moment,
  }) : super(key: key);

  /// child
  final Widget child;

  /// label
  final String? label;

  ///moment time
  final String? moment;

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
          if (label != null)
            const SizedBox(
              height: 16,
            ),
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: withGradient
                  ? Row(
                      children: [
                        Text(
                          label!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '$moment',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      label!,
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
