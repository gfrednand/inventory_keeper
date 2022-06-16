import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/controllers/index.dart';
import 'package:inventory_keeper/src/models/updatedAt/updated_at.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';

///Updated Controller
class UpdatedController extends BaseController {
  ///
  Rx<UpdatedAt?> updatedAtRx = Rx(const UpdatedAt());

  ///
  UpdatedAt? get updatedAt => updatedAtRx.value;

  @override
  void onReady() {
    ever(updatedAtRx, checkUpdatedValue);
    if (teamId != null) {
      updatedAtRx.bindStream(
        updatedAtCollectionRef(teamId!)
            .doc('latest')
            .snapshots()
            .map<UpdatedAt?>(
              (snapshot) => snapshot.data() != null
                  ? UpdatedAt.fromJson(snapshot.data()! as Map<String, dynamic>)
                  : null,
            ),
      );
    }
  }

  /// Check
  void checkUpdatedValue(UpdatedAt? updatedAt) {
    print(updatedAt?.toJson());

    if (updatedAt != null) {
      TeamSettingsController.instance.lastUpdatedAt =
          updatedAt.teamSettingsLastUpdate;
      UserController.instance.lastUpdatedAt = updatedAt.usersLastUpdate;
      RoleController.instance.lastUpdatedAt = updatedAt.rolesLastUpdate;
      // ProductController.instance.lastUpdatedAt =
      //     updatedAt.permissionsLastUpdate;
      ProductController.instance.lastUpdatedAt = updatedAt.productsLastUpdate;
      StockSummaryController.instance.lastUpdatedAt =
          updatedAt.stockSummariesLastUpdate;
      ProductTransactionController.instance.lastUpdatedAt =
          updatedAt.productTransactionsLastUpdate;
      PartnerController.instance.lastUpdatedAt = updatedAt.partnersLastUpdate;
      ProductCategoryController.instance.lastUpdatedAt =
          updatedAt.categoriesLastUpdate;
      // ProductSummaryController.instance.lastUpdatedAt =
      //     updatedAt.productsSummaryLastUpdate;
      TeamController.instance.lastUpdatedAt = updatedAt.teamsLastUpdate;
    }
  }
}
