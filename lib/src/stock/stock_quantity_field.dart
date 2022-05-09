import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/widgets/custom_stepper.dart';

///
// ignore: must_be_immutable
class StockQuantityField extends StatefulWidget {
  ///
  const StockQuantityField({
    Key? key,
    this.productName,
    this.currentQuantity,
    required this.title,
    this.counter = 0,
    this.initialCounter = 0,
    this.isIncrement = true,
    this.minValue = 0,
    this.maxValue = 999999999,
  }) : super(key: key);

  ///
  final String? productName;

  ///
  final String title;

  ///
  final bool isIncrement;

  ///
  final int? counter;

  ///
  final double minValue, maxValue;

  ///
  final int? currentQuantity;

  ///
  final int? initialCounter;

  ///

  @override
  State<StockQuantityField> createState() => _StockQuantityFieldState();
}

class _StockQuantityFieldState extends State<StockQuantityField> {
  int _counter = 0;
  int _initialCounter = 0;

  @override
  void initState() {
    _counter = widget.counter ?? 0;
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
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.productName ?? '',
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
                  _initialCounter = (widget.currentQuantity ?? 0) + val;
                } else {
                  // _initialCounter = _initialCounter - val;
                  _initialCounter = (widget.currentQuantity ?? 0) - val;
                }
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          if (widget.currentQuantity == null)
            Container()
          else
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${widget.currentQuantity}',
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
                    '$_initialCounter',
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
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, _counter);
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
