import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/partner/partner.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

///PartnerController
class PartnerController extends BaseController {
  ///PartnerController instance
  static PartnerController instance = Get.find();

  ///
  Partner? get partner => _partner;

  Partner? _partner;

  ///
  final RxInt _lastUpdatedAt = 0.obs;

  /// Last Updated At
  int get lastUpdatedAt => _lastUpdatedAt.value;

  /// Set Last Updated At
  set lastUpdatedAt(int value) {
    _lastUpdatedAt(value);
  }

  ///
  void changeType(Partner? partner) {
    _partner = partner;
    update();
  }

  ///
  Rx<List<Partner>> partnerList = Rx<List<Partner>>([]);

  ///
  List<Partner> _partners = [];

  ///
  List<Partner> get partners => _partners;

  @override
  void onReady() {
    ever(_lastUpdatedAt, fetchData);
  }

  ///
  TextEditingController nameController = TextEditingController();

  ///
  FocusNode nameFocusNode = FocusNode();

  /// Future Items
  Future<void> fetchData(int? lastUpdatedAt) async {
    final datas = <Partner>[];
    QuerySnapshot<Object?> snapShot;
    busy = true;
    if (lastUpdatedAt != null) {
      snapShot = await partnerCollectionRef
          .where('lastUpdatedAt', isEqualTo: lastUpdatedAt)
          .get();
    } else {
      snapShot = await partnerCollectionRef.get();
    }
    for (final doc in snapShot.docs) {
      final json = doc.data()! as Map<String, dynamic>;
      json['id'] = doc.id;
      datas.add(Partner.fromJson(json));
    }
    _partners = datas;
    busy = false;
  }

  /// Add a partner
  Future<void> addPartner(PartnerType type) async {
    busy = true;
    final map = <String, dynamic>{
      'name': nameController.text,
      'type': type.name,
      'lastUpdatedAt': dateToMillSeconds(DateTime.now())
    };
    final success = await partnerCollectionRef
        .add(map)
        .then((value) => true)
        .catchError((dynamic error) {
      print('Failed to add data: ${error.toString()}');
      return false;
    });
    busy = false;
    if (success) {
      nameController.text = '';

      Get.snackbar(
        type.name,
        'Successful Added',
      );
    } else {
      Get.snackbar(
        type.name,
        'Failed to Add',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Remove partner
  Future<void> removePartner(Partner item) async {
    busy = true;
    final success = await partnerCollectionRef
        .doc(item.id)
        .delete()
        .then((value) => true)
        .catchError((dynamic error) {
      print('Failed to delete user: $error');
      return false;
    });
    if (success) {}
    busy = false;
  }
}
