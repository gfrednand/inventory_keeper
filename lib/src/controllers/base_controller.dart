import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

///
class BaseController extends GetxController {
  ///
  final box = GetStorage();

  ///
  String? get teamId => box.read('selectedTeamId');

  bool _busy = false;
  String? _errorMessage;

  /// Is busy
  bool get busy => _busy;

  ///

  ///
  bool get hasErrorMessage => _errorMessage != null && _errorMessage != '';

  ///

  ///

  /// Set Busy Status
  set busy(bool value) {
    _busy = value;
    update();
  }
}
