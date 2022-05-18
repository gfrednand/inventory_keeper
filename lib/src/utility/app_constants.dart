import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/utility/colors.dart';

// enum ViewState { initial, busy, error, data }

///
BoxDecoration containerBoxDecoration() {
  return const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Color(0XFFE0E0E0),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3),
      )
    ],
  );
}

/// Box
BoxDecoration decorationWithGradient() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Color(0XFFE0E0E0),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3),
      )
    ],
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        AppColors.blue700,
        AppColors.red200,
      ],
    ),
  );
}
