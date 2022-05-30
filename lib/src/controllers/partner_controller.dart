import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/partner/partner.dart';

///
class PartnerController extends BaseController {
  final FireBaseRepository _api = FireBaseRepository('partner');

  ///
  Partner? get partner => _partner;

  Partner? _partner;

  ///
  void changeType(Partner? partner) {
    _partner = partner;
    update();
  }

  ///
  Rx<List<Partner>> partnerList = Rx<List<Partner>>([]);

  ///
  List<Partner> get partners => partnerList.value;
  @override
  void onReady() {
    partnerList.bindStream(
      _api.streamDataCollection().map(
            (maps) => maps.map((item) {
              return Partner.fromJson(item);
            }).toList(),
          ),
    );
  }

  ///
  TextEditingController nameController = TextEditingController();

  ///
  FocusNode nameFocusNode = FocusNode();

  /// Future Items
  Future<List<Partner>> fetchItems() async {
    busy = true;
    final objs = await _api.allItems();
    busy = false;
    final ps = <Partner>[];
    for (final item in objs) {
      ps.add(Partner.fromJson(item));
    }
    return ps;
  }

  /// Add a partner
  Future<void> addPartner(PartnerType type) async {
    final map = <String, dynamic>{
      'name': nameController.text,
      'type': type.name
    };
    final success = await _api.addOne(map);
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
    final success = await _api.removeOne(item.toJson());
    busy = false;
    if (success) {}
    update();
  }
}
