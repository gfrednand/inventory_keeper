import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/stock_summary/stock_summary.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';

/// Product Summary Controller
class StockSummaryController extends BaseController {
  ///StockSummaryController instance
  static StockSummaryController instance = Get.find();

  ///
  final RxInt _lastUpdatedAt = 0.obs;

  /// Last Updated At
  int get lastUpdatedAt => _lastUpdatedAt.value;

  /// Set Last Updated At
  set lastUpdatedAt(int value) {
    _lastUpdatedAt(value);
  }

  StockSummary? _stockSummary;

  ///
  StockSummary? get stockSummary => _stockSummary;

  List<StockSummary>? _stockSummaries;

  ///
  List<StockSummary>? get stockSummaries => _stockSummaries;

  @override
  void onReady() {
    fetchItems();
  }

  /// Future Items
  Future<void> fetchItems({int? lastUpdatedAt}) async {
    if (teamId != null) {
      busy = true;
      QuerySnapshot? snapshot;
      if (lastUpdatedAt != null) {
        snapshot = await stockSummaryCollectionRef(teamId!)
            .where('lastUpdatedAt', isEqualTo: lastUpdatedAt)
            .get();
      } else {
        snapshot = await stockSummaryCollectionRef(teamId!).get();
      }

      final objs = <StockSummary>[];
      for (final doc in snapshot.docs) {
        if (doc.data() != null) {
          // ignore: cast_nullable_to_non_nullable
          final json = doc.data() as Map<String, dynamic>;
          json['id'] = doc.id;
          objs.add(StockSummary.fromJson(json));
        }
      }
      _stockSummaries = objs;
      if (objs.isNotEmpty) {
        _stockSummary = objs[0];
      }
      busy = false;
    }
  }
}
