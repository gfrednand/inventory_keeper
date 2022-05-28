import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/models/product_transaction/product_transaction.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/widgets/custom_stepper.dart';

///
// ignore: must_be_immutable
class StockQuantityField extends StatefulWidget {
  ///
  const StockQuantityField({
    Key? key,
    this.productName,
    this.currentStock,
    required this.title,
    this.counter = 0,
    this.initialCounter = 0,
    required this.transactionType,
    this.minValue,
    this.maxValue,
  }) : super(key: key);

  ///
  final String? productName;

  ///
  final String title;

  ///
  final TransactionType transactionType;

  ///
  final int? counter;

  ///
  final double? minValue, maxValue;

  ///
  final int? currentStock;

  ///
  final int? initialCounter;

  ///

  @override
  State<StockQuantityField> createState() => _StockQuantityFieldState();
}

class _StockQuantityFieldState extends State<StockQuantityField> {
  int? _counter;
  int _initialCounter = 0;
  int _auditedQuantity = 0;

  @override
  void initState() {
    _counter = widget.counter?.abs() ?? 0;
    _initialCounter = widget.initialCounter ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.productName ?? '',
            style: const TextStyle(color: AppColors.blue200, fontSize: 18),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomStepper(
            iconSize: 24,
            minValue: widget.minValue,
            maxValue: widget.maxValue,
            initialValue: _counter,
            onChanged: (value) {
              setState(() {
                final val = value ?? widget.initialCounter ?? 0;
                if (widget.transactionType == TransactionType.inStock) {
                  _counter = value == null
                      ? value
                      : val > -1
                          ? val
                          : 0;
                  _initialCounter =
                      (widget.currentStock ?? 0) + (_counter ?? 0);
                } else if (widget.transactionType == TransactionType.outStock) {
                  _counter = value == null
                      ? value
                      : val > -1
                          ? val
                          : 0;
                  _initialCounter =
                      (widget.currentStock ?? 0) - (_counter ?? 0);
                } else if (widget.transactionType == TransactionType.audit) {
                  _counter = value;
                  _initialCounter = val;
                  _auditedQuantity = val - (widget.currentStock ?? 0);
                } else if (widget.transactionType == TransactionType.all) {
                  _counter = val;
                  _initialCounter = val;
                }
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          if (widget.currentStock == null)
            Container()
          else
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${widget.currentStock}',
                    style: const TextStyle(
                      color: AppColors.blue200,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.grey[400],
                    size: 20,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    '$_initialCounter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: _initialCounter > 0 ? Colors.teal : Colors.red,
                    ),
                  )
                ],
              ),
            ),
          const SizedBox(
            width: 20,
          ),
          if (widget.transactionType == TransactionType.audit &&
              _auditedQuantity != 0)
            Text(
              '(${_auditedQuantity > 0 ? ' +' : ''}$_auditedQuantity)',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: _auditedQuantity > 0 ? Colors.blue : Colors.red,
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
                      Navigator.pop(context, null);
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
                      primary: AppColors.blue700,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                    ),
                    onPressed: () {
                      Get.back<Map<String, int?>>(
                        result: {
                          'quantity': _counter ?? 0,
                          'auditedQuantity': _auditedQuantity,
                        },
                      );
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
    );
  }
}
