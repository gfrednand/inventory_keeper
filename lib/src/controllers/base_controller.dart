import 'package:flutter/material.dart';

///
class BaseController with ChangeNotifier {
  bool _busy = false;
  String? _errorMessage;

  /// Is busy
  bool get busy => _busy;

  ///
  String? get errorMessage => _errorMessage;

  ///
  bool get hasErrorMessage => _errorMessage != null && _errorMessage != '';

  ///
  void setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  /// Set Busy Status
  set busy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
