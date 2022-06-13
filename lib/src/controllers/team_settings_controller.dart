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
  TeamSettings? _teamSettings;

  ///
  TeamSettings? get teamSettings => _teamSettings;

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
    TeamSettings? data;
    QuerySnapshot<Object?> snapShot;
    if (lastUpdatedAt != null) {
      snapShot = await teamSettingsCollectionRef
          .where('lastUpdatedAt', isEqualTo: lastUpdatedAt)
          .get();
    } else {
      snapShot = await productsCollectionRef.get();
    }
    for (final doc in snapShot.docs) {
      // final json = doc.data()! as Map<String, dynamic>;
      // json['id'] = doc.id;
      // datas.add(TeamSettings.fromJson(json));
    }
    _teamSettings = data;
    update();
  }
}
