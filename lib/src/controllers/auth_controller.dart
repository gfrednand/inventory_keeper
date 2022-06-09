import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_keeper/src/auth/login_screen.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/homepage/layout_page.dart';
import 'package:inventory_keeper/src/models/user.dart' as model;
import 'package:inventory_keeper/src/utility/app_constants.dart';

///
class AuthController extends BaseController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  Rx<File?>? _pickedImage;

  ///
  File? get profilePhoto => _pickedImage?.value;

  ///
  User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll<void>(LoginScreen.new);
    } else {
      Get.offAll<void>(() => const LayoutPage());
    }
  }

  ///
  Future<void> pickImage() async {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture!');
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
      String username, String email, String password, File? image) async {
    try {
      busy = true;
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        /// save out user to our ath and firebase firestore
        final cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final downloadUrl = await _uploadToStorage(image);
        final user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadUrl,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
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
  Future<void> loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Loggin gin',
        e.toString(),
      );
    }
  }

  ///
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
