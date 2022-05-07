import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/stock/stock_quantity_field.dart';
import 'package:provider/provider.dart';

/// Check if number is integer

bool isInteger(num value) => value is int || value == value.roundToDouble();

/// Convert timestamp to datetime
DateTime? parseTime(dynamic date) {
  return date == null ? null : (date as Timestamp).toDate();
}

final oCcy = NumberFormat.currency(
  locale: 'en_TZ',
  customPattern: '#,### \u00a4',
  symbol: 'TSh',
  decimalDigits: 0,
);

/// Showing loading dialog
Future loadDialog<T>(
  BuildContext context, {
  String loadingText = 'Loading...',
}) {
  return showDialog<T>(
    barrierDismissible: false,
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                height: 15,
              ),
              Text(loadingText),
            ],
          ),
        ),
      );
    },
  );
}

///
Future<void> rersfsdf(
    BuildContext context, TextEditingController? controller) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Input stock quantity',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text('Pepsi'),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 3,
                    fillColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.remove,
                      size: 35,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 30,
                        // height: 2,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                      controller: controller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                      ),
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 3,
                    fillColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.add,
                      size: 35,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      '0',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      '0',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 205, 204, 204),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Apply',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

///
Future<void> displayDialog(
  BuildContext context,
  Widget? child,
) async =>
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: child,
        );
      },
    );
