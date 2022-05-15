import 'package:flutter/material.dart';

/// App snackbar
class AppSnackbar {
  ///
  void show(BuildContext context, String message) {
    final snack = SnackBar(
      elevation: 3,
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      duration: const Duration(seconds: 3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      //backgroundColor: Colors.redAccent,
      action: SnackBarAction(
        textColor: const Color(0xFFFAF2FB),
        label: 'OK',
        onPressed: () {
          // ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    // ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
