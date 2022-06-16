import 'package:get/get.dart';
import 'package:inventory_keeper/src/services/data_service.dart';
import 'package:inventory_keeper/src/team/team_initial_page.dart';

///
class BaseController extends GetxController {
  ///
  String? get teamId {
    final id = Get.find<DataService>().restoreTeamId();
    if (id == null) {
      Get.offAll<void>(() => const TeamInitialPage());
      return null;
    } else {
      return id;
    }
  }

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
