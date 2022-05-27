import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_keeper/src/widgets/circle_with_icon_button.dart';

///
typedef CounterChangeCallback = void Function(int value);

///
// ignore: must_be_immutable
class CustomStepper extends StatelessWidget {
  ///
  CustomStepper({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    this.decimalPlaces = 0,
    this.step = 1,
    this.iconSize = 25,
    required this.initialValue,
  })  :
        // assert(maxValue > minValue, 'Max Value is less than min value'),
        //       assert(
        //         initialValue >= minValue && initialValue <= maxValue,
        //         'Initial Value is less than min value or greater than Max value',
        //       ),
        //       assert(step > 0, 'Step is less than 0'),
        selectedValue = initialValue.abs(),
        super(key: key);

  ///min value user can pick
  final double minValue;

  ///max value user can pick
  final double maxValue;

  /// if min=0, max=5, step=3, then items will be 0 and 3.
  final int step;

  ///
  final double iconSize;

  ///
  final CounterChangeCallback onChanged;

  ///
  int initialValue;

  /// decimal places required by the counter
  final int decimalPlaces;

  ///Currently selected integer value
  int selectedValue;

  void _incrementCounter() {
    if (selectedValue + step <= maxValue) {
      onChanged(selectedValue + step);
    }
  }

  void _decrementCounter() {
    if (selectedValue - step >= minValue) {
      onChanged(selectedValue - step);
    }
  }

  ///
  TextEditingController quantityController = TextEditingController(text: '0');
  @override
  Widget build(BuildContext context) {
    final text = '${int.parse(selectedValue.toStringAsFixed(decimalPlaces))}';
    quantityController = TextEditingController()
      ..text = text
      ..selection = TextSelection(
        baseOffset: text.length,
        extentOffset: text.length,
      );
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleWithIconButton(
            iconData: Icons.remove,
            iconSize: iconSize,
            onPressed: _decrementCounter,
          ),
          Expanded(
            child: SizedBox(
              width: iconSize,
              child: TextFormField(
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(9),
                ],
                controller: quantityController,
                style: const TextStyle(
                  fontSize: 30,
                  // height: 2,
                  fontWeight: FontWeight.bold,
                ),
                // textAlign: TextAlign.center,
                autofocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  final val = int.tryParse(value);
                  onChanged(val ?? 0);
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),

              // Text(
              //   '${num.parse(selectedValue.toStringAsFixed(decimalPlaces))}',
              //   style: TextStyle(
              //     fontSize: iconSize * 2,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
            ),
          ),
          CircleWithIconButton(
            iconData: Icons.add,
            iconSize: iconSize,
            onPressed: _incrementCounter,
          ),
        ],
      ),
    );
  }

  ///
  void getCursorCurrentPosn(String newText) {
    final cursorPos = quantityController.selection.base.offset;

    // Right text of cursor position
    final suffixText = quantityController.text.substring(cursorPos);

    // Add new text on cursor position
    final specialChars = newText;
    final length = specialChars.length;

    // Get the left text of cursor
    final prefixText = quantityController.text.substring(0, cursorPos);

    quantityController.text = prefixText + specialChars + suffixText;

    // Cursor move to end of added text
    // ignore: cascade_invocations
    quantityController.selection = TextSelection(
      baseOffset: cursorPos + length,
      extentOffset: cursorPos + length,
    );
  }
}
