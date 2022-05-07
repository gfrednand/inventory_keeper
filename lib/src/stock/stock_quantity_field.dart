import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/widgets/custom_stepper.dart';

///
class StockQuantityField extends StatefulWidget {
  ///
  const StockQuantityField({
    Key? key,
    required this.controller,
    required this.title,
    required this.initialValue,
    this.isIncrement = true,
    this.isSafetyQuantity = false,
    this.minValue = 0,
    this.maxValue = 999999999,
  }) : super(key: key);

  ///
  final ProductController controller;

  ///
  final String title;

  ///
  final bool isSafetyQuantity, isIncrement;

  ///
  final int initialValue;

  ///
  final double minValue, maxValue;

  @override
  State<StockQuantityField> createState() => _StockQuantityFieldState();
}

class _StockQuantityFieldState extends State<StockQuantityField> {
  int _counter = 0;
  int _defaultValue = 0;

  @override
  void initState() {
    _counter = widget.initialValue;
    _defaultValue = widget.isSafetyQuantity ? widget.initialValue : 0;
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
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.controller.nameController.text,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomStepper(
            iconSize: 24,
            minValue: widget.minValue,
            maxValue: widget.maxValue,
            initialValue: _defaultValue,
            onChanged: (val) {
              setState(() {
                _defaultValue = val;
                if (widget.isSafetyQuantity) {
                  _counter = val;
                } else {
                  if (widget.isIncrement) {
                    _counter = widget.initialValue + _defaultValue;
                  } else {
                    // _defaultValue = _defaultValue - val;
                    _counter = widget.initialValue - _defaultValue;
                  }
                }
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          if (widget.isSafetyQuantity)
            Container()
          else
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${widget.controller.product?.currentStock ?? 0}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    '$_counter',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
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
                      final enums = widget.isSafetyQuantity
                          ? SelectedQuantityEnum.updateSafetyStock
                          : SelectedQuantityEnum.updateStock;

                      widget.controller.setSelectedQuantity(_counter, enums);
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
    );
  }
}
