import 'package:flutter/material.dart';

/// #493491 blueish
const Color kPrimaryColor = Color.fromRGBO(0, 64, 93, 1);

/// #f37a21 orange
const Color kActiveColor = Color(0xFFF37A21);

/// white
const Color kTextColor = Color(0xFFFFFFFF);

/// default padding
const kDefaultPadding = 20.0;

/// yellow color
const kPrimaryDarkYellow = Color(0XFFBE8f17);

/// green color 5db166
const kPrimaryDarkGreen = Color(0XFF5DB166);

/// blue color
const kPrimaryDarkBlue = Color(0XFF060488);

/// gryish color 8a9361
const kPrimaryDarkGrey = Color(0XFF8A9361);

/// gryish color 8a9361
const kPrimaryLightGrey = Color(0XFFE7E7E7);

/// deep red
const kPrimaryRed = Color(0xFFB00020);

// enum ViewState { initial, busy, error, data }

///
BoxDecoration containerBoxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3),
      )
    ],
  );
}
