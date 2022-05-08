import 'package:flutter/material.dart';

///
class CircleWithIconButton extends StatelessWidget {
  ///
  const CircleWithIconButton({
    Key? key,
    this.onPressed,
    this.onLongPress,
    required this.iconData,
    required this.iconSize,
  }) : super(key: key);

  ///
  final void Function()? onPressed;

  ///
  final void Function()? onLongPress;

  ///
  final IconData iconData;

  ///
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      elevation: 1,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(15),
      shape: const CircleBorder(),
      child: Icon(
        iconData,
        size: 35,
      ),
    );
  }
}
