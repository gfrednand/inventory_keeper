import 'package:flutter/material.dart';

///
class CustomAppBar extends StatelessWidget {
  ///
  const CustomAppBar({
    Key? key,
    this.text,
    this.centerTitle = false,
    this.flexibleSpace,
    this.actions,
  }) : super(key: key);

  ///
  final String? text;

  ///
  final bool centerTitle;

  ///
  final Widget? flexibleSpace;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    Widget? title;
    if (text != null) {
      title = Text(
        text!,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return SliverAppBar(
      title: title,
      backgroundColor: Theme.of(context).canvasColor,
      centerTitle: centerTitle,
      expandedHeight: 100,
      stretch: true,
      pinned: true,
      elevation: 0,
      actions: actions,
      flexibleSpace: flexibleSpace,
    );
  }
}
