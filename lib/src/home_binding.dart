// ignore_for_file: cascade_invocations

import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/auth_controller.dart';
import 'package:inventory_keeper/src/controllers/partner_controller.dart';
import 'package:inventory_keeper/src/controllers/product_category_controller.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_transaction_controller.dart';
import 'package:inventory_keeper/src/controllers/role_controller.dart';
import 'package:inventory_keeper/src/controllers/stock_summary_controller.dart';
import 'package:inventory_keeper/src/controllers/team_controller.dart';
import 'package:inventory_keeper/src/controllers/team_settings_controller.dart';
import 'package:inventory_keeper/src/controllers/user_controller.dart';

///
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TeamController>(TeamController());
    Get.put<UserController>(UserController());
    Get.put<AuthController>(AuthController());
    Get.put<ProductController>(ProductController());
    Get.put<ProductTransactionController>(ProductTransactionController());
    Get.put<StockSummaryController>(StockSummaryController());
    Get.put<PartnerController>(PartnerController());

    Get.put<ProductCategoryController>(ProductCategoryController());
    Get.put<TeamSettingsController>(TeamSettingsController());
    Get.put<RoleController>(RoleController());
    // Get.put<ProductSummaryController>(ProductSummaryController());
  }
}
