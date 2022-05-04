import 'package:flutter/material.dart';

///
class CustomDetailItemTile extends StatelessWidget {
  ///
  const CustomDetailItemTile(
      {Key? key, required this.label, required this.value})
      : super(key: key);

  ///
  final String label;

  ///
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 94, 94, 94),
                fontWeight: FontWeight.w400),
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 94, 94, 94),
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
