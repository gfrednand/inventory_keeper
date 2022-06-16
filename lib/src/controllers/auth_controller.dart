import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_keeper/src/auth/phone_number_field_page.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/controllers/index.dart';

import 'package:inventory_keeper/src/homepage/layout_page.dart';
import 'package:inventory_keeper/src/models/user/user.dart' as model;
import 'package:inventory_keeper/src/team/team_initial_page.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';

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

  @override
  void onReady() {
    super.onReady();
    _authUser = Rx<User?>(firebaseAuth.currentUser);
    _authUser.bindStream(firebaseAuth.authStateChanges());
    ever(_authUser, _setInitialScreen);
  }

  void _setInitialScreen(User? authUser) {
    if (authUser == null) {
      Get.offAll<void>(PhoneNumberFieldPage.new);
    } else {
      Get.put(UpdatedController());
      box.write('loggedInUserId', authUser.uid);

      Get.offAll<void>(() => const LayoutPage());
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
          lastUpdatedAt: DateTime.now().millisecondsSinceEpoch,
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
