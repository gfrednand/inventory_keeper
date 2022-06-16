import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/role/role.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';

///Role Controller
class RoleController extends BaseController {
  ///Role Controller instance
  static RoleController instance = Get.find();

  ///
  List<Role> _roles = [];

  ///
  List<Role> get roles => _roles;

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
      busy = true;
      final datas = <Role>[];
      QuerySnapshot<Object?> snapShot;
      if (lastUpdatedAt != null) {
        snapShot = await rolesCollectionRef(teamId!)
            .where('lastUpdatedAt', isEqualTo: lastUpdatedAt)
            .get();
      } else {
        snapShot = await rolesCollectionRef(teamId!).get();
      }
      for (final doc in snapShot.docs) {
        final json = doc.data()! as Map<String, dynamic>;
        json['id'] = doc.id;
        datas.add(Role.fromJson(json));
      }
      _roles = _roles..addAll(datas);
      final seen = <String>{};
      _roles = _roles.where((i) => seen.add(i.id ?? '')).toList();
      busy = false;
    }
  }
}
