import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/homepage/layout_page.dart';
import 'package:inventory_keeper/src/models/team/team.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';

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
  void onInit() {
    super.onInit();
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
  Future<void> registerTeam(String name) async {
    final team = Team(
      userId: firebaseAuth.currentUser!.uid,
      name: name,
      lastUpdatedAt: DateTime.now().millisecondsSinceEpoch,
    );
    final success = await teamCollectionRef
        .add(team.toJson())
        .then((value) => true)
        .catchError((dynamic error) {
      print('Failed to add data: ${error.toString()}');
      return false;
    });
    if (success) {
      Get.snackbar(
        'Team',
        'Added Successful',
      );

      await Get.to<void>(() => const LayoutPage());
    }
  }
}
