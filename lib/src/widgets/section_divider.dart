import 'package:flutter/material.dart';

///
class SectionDivider extends StatelessWidget {
  ///
  const SectionDivider({this.color, Key? key}) : super(key: key);

  ///
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.1,
      indent: 10,
      endIndent: 10,
      color: color,
    );
  }
}
