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
              onPressed: onPressed,
              child: const Text('Delete'),
            )
          ],
        ),
      ),
    );
  }
}
