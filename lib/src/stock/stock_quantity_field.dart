import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';
import 'package:inventory_keeper/src/models/product.dart';
import 'package:inventory_keeper/src/widgets/custom_stepper.dart';
import 'package:provider/provider.dart';

///
class StockQuantityField extends StatefulWidget {
  ///
  StockQuantityField({
    Key? key,
    required this.controller,
    required this.currentStock,
    required this.product,
    required this.title,
    this.counter = 0,
    this.defaultValue = 0,
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
  final int? counter;

  ///
  final double minValue, maxValue;

  ///
  final int currentStock;

  ///
  final int? defaultValue;

  ///
  Product product;

  @override
  State<StockQuantityField> createState() => _StockQuantityFieldState();
}

class _StockQuantityFieldState extends State<StockQuantityField> {
  int _counter = 0;
  int _defaultValue = 0;

  @override
  void initState() {
    _counter = widget.counter!;
    _defaultValue = widget.defaultValue!;
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
            initialValue: _counter,
            onChanged: (val) {
              setState(() {
                _counter = val;

                if (widget.isIncrement) {
                  _defaultValue = widget.currentStock + _counter;
                } else {
                  // _defaultValue = _defaultValue - val;
                  _defaultValue = widget.currentStock - _counter;
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
                    '${widget.currentStock}',
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
                    '$_defaultValue',
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
                      Navigator.pop(context, false);
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
                      if (widget.isSafetyQuantity) {
                        widget.controller.setSelectedSafetyQuantity(
                          _counter,
                          _defaultValue,
                        );
                      } else {
                        widget.product = widget.product.copyWith(
                          selectedQuantity: _counter,
                          isIncomingStock: widget.isIncrement,
                        );
                        context
                            .read<StockController>()
                            .addToCart(widget.product);
                      }
                      Navigator.pop(context, true);
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
