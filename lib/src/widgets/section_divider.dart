import 'package:flutter/material.dart';

///
class SectionDivider extends StatelessWidget {
  ///
  const SectionDivider({this.color, this.thickness = 0.5, Key? key})
      : super(key: key);

  ///
  final Color? color;

  /// Divider thickness
  final double? thickness;
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      indent: 10,
      endIndent: 10,
      color: color,
    );
  }
}
