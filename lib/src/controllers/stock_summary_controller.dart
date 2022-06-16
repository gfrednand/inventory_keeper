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

  List<StockSummary> _stockSummaries = [];

  ///
  List<StockSummary> get stockSummaries => _stockSummaries;

  @override
  void onReady() {
    ever(_lastUpdatedAt, fetchData);
  }

  /// Future Items
  Future<void> fetchData(int? lastUpdatedAt) async {
    if (teamId != null) {
      busy = true;
      QuerySnapshot? snapshot;
      if (lastUpdatedAt != null && _stockSummaries.isNotEmpty) {
        snapshot = await stockSummaryCollectionRef(teamId!)
            .where('lastUpdatedAt', isEqualTo: lastUpdatedAt)
            .get();
      } else {
        snapshot = await stockSummaryCollectionRef(teamId!).get();
      }

      final datas = <StockSummary>[];
      for (final doc in snapshot.docs) {
        if (doc.data() != null) {
          // ignore: cast_nullable_to_non_nullable
          final json = doc.data() as Map<String, dynamic>;
          json['id'] = doc.id;
          datas.add(StockSummary.fromJson(json));
        }
      }
      _stockSummaries = _stockSummaries..addAll(datas);
      final seen = <String>{};
      _stockSummaries =
          _stockSummaries.where((i) => seen.add(i.id ?? '')).toList();

      if (_stockSummaries.isNotEmpty) {
        _stockSummary = _stockSummaries[0];
      }
      busy = false;
    }
  }
}
