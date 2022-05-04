import 'package:flutter/material.dart';

///
class CustomModalSheet {
  ///
  static void show({
    required Widget child,
    bool isExpanded = true,
    required BuildContext context,
  }) {
    _show<dynamic>(context, child, isExpanded);
  }

  ///
  static void _show<T>(
      BuildContext context, Widget child, bool isExpanded) async {
    await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 0,
              maxHeight: MediaQuery.of(context).size.width * 1.3,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (isExpanded)
                  Expanded(
                    child: child,
                  )
                else
                  child,
                const Divider(),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
