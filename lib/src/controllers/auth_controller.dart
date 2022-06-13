import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_keeper/src/auth/login_screen.dart';
import 'package:inventory_keeper/src/auth/phone_number_field_page.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/controllers/partner_controller.dart';
import 'package:inventory_keeper/src/controllers/product_category_controller.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_summary_controller.dart';
import 'package:inventory_keeper/src/controllers/product_transaction_controller.dart';
import 'package:inventory_keeper/src/controllers/role_controller.dart';
import 'package:inventory_keeper/src/controllers/stock_summary_controller.dart';
import 'package:inventory_keeper/src/controllers/team_controller.dart';
import 'package:inventory_keeper/src/controllers/team_settings_controller.dart';
import 'package:inventory_keeper/src/controllers/user_controller.dart';
import 'package:inventory_keeper/src/homepage/layout_page.dart';
import 'package:inventory_keeper/src/models/team/team.dart';
import 'package:inventory_keeper/src/models/updatedAt/updated_at.dart';
import 'package:inventory_keeper/src/models/user/user.dart' as model;
import 'package:inventory_keeper/src/team/team_initial_page.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';
import 'package:inventory_keeper/src/utility/helpers.dart';

///AuthController
class AuthController extends BaseController {
  ///AuthController instance
  static AuthController instance = Get.find();
  late Rx<User?> _authUser;
  Rx<File?>? _pickedImage;

  ///
  File? get profilePhoto => _pickedImage?.value;

  ///
  User get authUser => _authUser.value!;

  ///
  Rx<UpdatedAt?> updatedAtRx = Rx(const UpdatedAt());

  ///
  UpdatedAt? get updatedAt => updatedAtRx.value;

  /// Check
  void checkUpdatedValue(UpdatedAt? updatedAt) {
    if (updatedAt != null) {
      TeamSettingsController.instance.lastUpdatedAt =
          updatedAt.settingsLastUpdate;
      UserController.instance.lastUpdatedAt = updatedAt.usersLastUpdate;
      RoleController.instance.lastUpdatedAt = updatedAt.rolesLastUpdate;
      // ProductController.instance.lastUpdatedAt =
      //     updatedAt.permissionsLastUpdate;
      ProductController.instance.lastUpdatedAt = updatedAt.productsLastUpdate;
      StockSummaryController.instance.lastUpdatedAt =
          updatedAt.stockSummaryLastUpdate;
      ProductTransactionController.instance.lastUpdatedAt =
          updatedAt.productTransactionsLastUpdate;
      PartnerController.instance.lastUpdatedAt = updatedAt.partnerLastUpdate;
      ProductCategoryController.instance.lastUpdatedAt =
          updatedAt.categoryLastUpdate;
      ProductSummaryController.instance.lastUpdatedAt =
          updatedAt.productsSummaryLastUpdate;
      TeamController.instance.lastUpdatedAt = updatedAt.teamLastUpdate;
    }
  }

  @override
  void onReady() {
    super.onReady();
    _authUser = Rx<User?>(firebaseAuth.currentUser);
    _authUser.bindStream(firebaseAuth.authStateChanges());
    ever(_authUser, _setInitialScreen);
    ever(updatedAtRx, checkUpdatedValue);
    updatedAtRx.bindStream(
      updatedAtCollectionRef.snapshots().map(
        (snapshot) {
          return snapshot.docs.isNotEmpty
              ? UpdatedAt.fromJson(
                  snapshot.docs.first.data()! as Map<String, dynamic>,
                )
              : null;
        },
      ),
    );
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll<void>(PhoneNumberFieldPage.new);
    } else {
      final teams = TeamController.instance.teams;
      final user = UserController.instance.user;

      final dooesUserHaveTeam = user != null &&
          teams != null &&
          teams.firstWhereOrNull(
                (team) => team.id != user.selectedTeamUid,
              ) !=
              null;
      if (dooesUserHaveTeam) {
        Get.offAll<void>(() => const LayoutPage());
      } else {
        Get.offAll<void>(() => const TeamInitialPage());
      }
    }
  }

  ///
  Future<void> pickImage() async {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedImage != null) {
      Get.snackbar(
        'Profile Picture',
        'You have successfully selected your profile picture!',
      );
      _pickedImage = Rx<File?>(File(pickedImage.path));
    }
  }

  // upload to firebase storage
  Future<String> _uploadToStorage(File image) async {
    final ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    final uploadTask = ref.putFile(image);
    final snap = await uploadTask;
    final downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  /// registering the user
  Future<void> registerUser(
    String username,
    String phoneNumber,
    String password,
    File? image,
  ) async {
    try {
      busy = true;
      if (username.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        /// save out user to our ath and firebase firestore
        final cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: '$phoneNumber@inventoryKeeper.rahisi',
          password: password,
        );
        final downloadUrl = await _uploadToStorage(image);
        final user = model.User(
          phoneNumber: phoneNumber,
          fullname: username,
          email: '$phoneNumber@inventoryKeeper.rahisi',
          uid: cred.user!.uid,
          photoUrl: downloadUrl,
          lastUpdatedAt: dateToMillSeconds(DateTime.now()),
        );
        await usersCollectionRef.doc(cred.user!.uid).set(user.toJson());
      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
        );
      }
      busy = false;
    } catch (e) {
      busy = false;
      print(e.toString());
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
    }
  }

  ///
  Future<void> loginUser(String phoneNumber, String password) async {
    try {
      busy = true;
      if (phoneNumber.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
          email: '$phoneNumber@inventoryKeeper.rahisi',
          password: password,
        );
      } else {
        Get.snackbar(
          'Error Login',
          'Please enter all the fields',
        );
      }
      busy = false;
    } catch (e) {
      busy = false;
      Get.snackbar(
        'Error Login',
        e.toString(),
      );
    }
  }

  ///
  Future<void> signOut() async {
    busy = true;
    await firebaseAuth.signOut();
    busy = false;
  }
}
