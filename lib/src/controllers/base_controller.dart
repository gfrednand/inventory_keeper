import 'package:get/get.dart';

///
class BaseController extends GetxController {
  bool _busy = false;
  String? _errorMessage;

  /// Is busy
  bool get busy => _busy;

  ///

  ///
  bool get hasErrorMessage => _errorMessage != null && _errorMessage != '';

  ///

  /// Set Busy Status
  set busy(bool value) {
    _busy = value;
    update();
  }
}
