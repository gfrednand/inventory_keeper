import 'package:flutter/material.dart';

///
class BaseController with ChangeNotifier {
  bool _busy = false;

  /// Is busy
  bool get busy => _busy;

  /// Set Busy Status
  set busy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
