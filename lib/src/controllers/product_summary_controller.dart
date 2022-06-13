import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/product_summary/product_summary.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';

/// ProductSummaryController
class ProductSummaryController extends BaseController {
  ///ProductSummaryController instance
  static ProductSummaryController instance = Get.find();

  ///
  final RxInt _lastUpdatedAt = 0.obs;

  /// Last Updated At
  int get lastUpdatedAt => _lastUpdatedAt.value;

  ///
  List<ProductSummary> _productSummaries = [];

  ///
  List<ProductSummary> get productSummaries => _productSummaries;

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
    final datas = <ProductSummary>[];
    QuerySnapshot<Object?> snapShot;
    if (lastUpdatedAt != null) {
      snapShot = await productsCollectionRef
          .where('lastUpdatedAt', isEqualTo: lastUpdatedAt)
          .get();
    } else {
      snapShot = await productsCollectionRef.get();
    }
    for (final doc in snapShot.docs) {
      final json = doc.data()! as Map<String, dynamic>;
      json['id'] = doc.id;
      datas.add(ProductSummary.fromJson(json));
    }
    _productSummaries = datas;
    update();
  }
}
