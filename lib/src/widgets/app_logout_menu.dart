import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/auth_controller.dart';

import 'package:inventory_keeper/src/widgets/modal_sheet.dart';

///Delete menu class
class AppLogoutMenu {
  /// Show delete menu
  void show(
    BuildContext context,
  ) {
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
                Get.find<AuthController>().signOut();
              },
              child: const Text(
                'Sign Out',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
