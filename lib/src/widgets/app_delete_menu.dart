import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/widgets/modal_sheet.dart';

///Delete menu class
class AppDeleteMenu {
  /// Show delete menu
  void show(BuildContext context, void Function()? onPressed) {
    CustomModalSheet.show(
      isExpanded: false,
      context: context,
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _delete(context, onPressed);
              },
              child: const Text('Delete'),
            )
          ],
        ),
      ),
    );
  }

  void _delete(BuildContext context, void Function()? onPressed) {
    showDialog<void>(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Please Confirm'),
          content: const Text('Are you sure to delete?'),
          actions: [
            // The "Yes" button
            TextButton(
              onPressed: onPressed,
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            )
          ],
        );
      },
    );
  }
}
