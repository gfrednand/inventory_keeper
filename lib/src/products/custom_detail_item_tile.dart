import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

///
class CustomDetailItemTile extends StatelessWidget {
  ///
  const CustomDetailItemTile({
    Key? key,
    required this.label,
    required this.value,
    this.hintText,
  }) : super(key: key);

  ///
  final String label;

  ///
  final String? hintText;

  ///
  final String value;
  @override
  Widget build(BuildContext context) {
    final children = [
      Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 94, 94, 94),
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 94, 94, 94),
          fontWeight: FontWeight.w400,
        ),
      )
    ];

    return InkWell(
      onTap: () {
        if (hintText != null) {
          children.insert(
            1,
            Text(
              hintText!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
                // fontWeight: FontWeight.w500,
              ),
            ),
          );
        }
        displayDialog<void>(
          context,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 16,
              ),
              ...children,
              const Divider(),
              ElevatedButton(
                onPressed: () {
                  if (hintText != null) children.removeAt(1);
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              )
            ],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
