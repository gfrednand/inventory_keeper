import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/team_settings/team_settings.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';

///Setting Controller
class TeamSettingsController extends BaseController {
  ///Setting Controller instance
  static TeamSettingsController instance = Get.find();

  ///
  TeamSettings? _teamSetting;

  ///
  TeamSettings? get teamSetting => _teamSetting;

  List<TeamSettings> _teamSettings = [];

  ///
  List<TeamSettings> get teamSettings => _teamSettings;

  ///
  final RxInt _lastUpdatedAt = 0.obs;

  /// Last Updated At
  int get lastUpdatedAt => _lastUpdatedAt.value;

  /// Set Last Updated At
  set lastUpdatedAt(int value) {
    _lastUpdatedAt(value);
  }

  @override
  void onReady() {
    ever(_lastUpdatedAt, fetchData);
  }

  /// Future Items
  Future<void> fetchData(int? lastUpdatedAt) async {
    if (teamId != null) {
      final datas = <TeamSettings>[];
      QuerySnapshot<Object?> snapShot;
      if (lastUpdatedAt != null) {
        snapShot = await teamSettingsCollectionRef(teamId!)
            .where('lastUpdatedAt', isEqualTo: lastUpdatedAt)
            .get();
      } else {
        snapShot = await teamSettingsCollectionRef(teamId!).get();
      }
      for (final doc in snapShot.docs) {
        final json = doc.data()! as Map<String, dynamic>;
        json['id'] = doc.id;
        datas.add(TeamSettings.fromJson(json));
      }
      _teamSettings = datas;
      _teamSettings = _teamSettings..addAll(datas);
      final seen = <String>{};
      _teamSettings = _teamSettings.where((i) => seen.add(i.id ?? '')).toList();

      if (_teamSettings.isNotEmpty) {
        _teamSetting = _teamSettings[0];
      }
      busy = false;

      update();
    }
  }
}
