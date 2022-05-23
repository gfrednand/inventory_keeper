// ignore_for_file: cascade_invocations

import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_type_controller.dart';
import 'package:inventory_keeper/src/controllers/stock_controller.dart';

///
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
    Get.put<StockController>(StockController());
    Get.put<ProductTypeController>(ProductTypeController());
  }
}
