import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/auth/signup_screen.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/team/team.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';
import 'package:uuid/uuid.dart';

/// Team Controller
class TeamController extends BaseController {
  ///Team Controller instance
  static TeamController instance = Get.find();

  ///
  final RxInt _lastUpdatedAt = 0.obs;

  /// Last Updated At
  int get lastUpdatedAt => _lastUpdatedAt.value;

  List<Team>? _teams;

  ///
  List<Team>? get teams => _teams;

  Team? _createdTeam;

  ///created Team
  Team? get createdTeam => _createdTeam;

  /// Set Last Updated At
  set lastUpdatedAt(int value) {
    _lastUpdatedAt(value);
  }

  @override
  void onReady() {
    fetchItems();
  }

  /// Future Items
  Future<void> fetchItems({int? lastUpdatedAt}) async {
    busy = true;
    QuerySnapshot? snapshot;
    if (lastUpdatedAt != null) {
      snapshot = await teamCollectionRef
          .where('lastUpdatedAt', isEqualTo: lastUpdatedAt)
          .get();
    } else {
      snapshot = await teamCollectionRef.get();
    }

    final objs = <Team>[];
    for (final doc in snapshot.docs) {
      if (doc.data() != null) {
        // ignore: cast_nullable_to_non_nullable
        final json = doc.data() as Map<String, dynamic>;
        json['id'] = doc.id;
        objs.add(Team.fromJson(json));
      }
    }
    _teams = objs;

    busy = false;
  }

  /// Register Team
  void registerTeam(Team team) {
    _createdTeam = team.copyWith(id: const Uuid().v4());
    Get.to<void>(SignupScreen.new);
  }
}
