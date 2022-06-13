import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/auth/login_screen.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/user/user.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';

/// User Controlelr
class UserController extends BaseController {
  ///User controller instance
  static UserController instance = Get.find();

  ///
  final RxInt _lastUpdatedAt = 0.obs;

  /// Last Updated At
  int get lastUpdatedAt => _lastUpdatedAt.value;

  /// Set Last Updated At
  set lastUpdatedAt(int value) {
    _lastUpdatedAt(value);
  }

  User? _user;

  ///
  User? get user => _user;

  final Rx<String> _uid = ''.obs;

  /// Update user Id
  void updateUserId({String? uid}) {
    var userUid = firebaseAuth.currentUser!.uid;

    if (uid != null) {
      userUid = uid;
    }
    _uid.value = userUid;
    getUserData();
  }

  ///
  Future<void> checkByPhoneNumber(String phoneNumber) async {
    busy = true;
    User? user;
    final snapshot = await usersCollectionRef
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();
    if (snapshot.docs.isNotEmpty) {
      user = User.fromJson(snapshot.docs[0].data()! as Map<String, dynamic>);
    }
    if (user == null) {
      Get.snackbar(
        'Oops',
        'Phone number does not exist, please regiser',
        colorText: Colors.red,
        // forwardAnimationCurve: Curves.easeOutBack,
        // snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      await Get.to<void>(LoginScreen(phoneNumber: phoneNumber));
    }
    busy = false;
  }

  ///
  Future<void> getUserData() async {
    // final thumbnails = <String>[];
    // final myVideos = await firestore
    //     .collection('videos')
    //     .where('uid', isEqualTo: _uid.value)
    //     .get();
    busy = true;
    final userDoc = await usersCollectionRef.doc(_uid.value).get();
    if (userDoc.data() != null) {
      final userData = userDoc.data()! as Map<String, dynamic>;

      _user = User.fromJson(userData);
    }
    busy = false;

    // var likes = 0;
    // var followers = 0;
    // var following = 0;
    // var isFollowing = false;

    // for (final item in myVideos.docs) {
    //   likes += (item.data()['likes'] as List).length;
    // }
    // final followerDoc = await firestore
    //     .collection('users')
    //     .doc(_uid.value)
    //     .collection('followers')
    //     .get();
    // final followingDoc = await firestore
    //     .collection('users')
    //     .doc(_uid.value)
    //     .collection('following')
    //     .get();
    // followers = followerDoc.docs.length;
    // following = followingDoc.docs.length;

    // await firestore
    //     .collection('users')
    //     .doc(_uid.value)
    //     .collection('followers')
    //     .doc(authController.user.uid)
    //     .get()
    //     .then((value) {
    //   if (value.exists) {
    //     isFollowing = true;
    //   } else {
    //     isFollowing = false;
    //   }
    // });
  }

  // followUser() async {
  //   final doc = await firestore
  //       .collection('users')
  //       .doc(_uid.value)
  //       .collection('followers')
  //       .doc(authController.user.uid)
  //       .get();

  //   if (!doc.exists) {
  //     await firestore
  //         .collection('users')
  //         .doc(_uid.value)
  //         .collection('followers')
  //         .doc(authController.user.uid)
  //         .set({});
  //     await firestore
  //         .collection('users')
  //         .doc(authController.user.uid)
  //         .collection('following')
  //         .doc(_uid.value)
  //         .set({});
  //     _user.value.update(
  //       'followers',
  //       (value) => (int.parse(value) + 1).toString(),
  //     );
  //   } else {
  //     await firestore
  //         .collection('users')
  //         .doc(_uid.value)
  //         .collection('followers')
  //         .doc(authController.user.uid)
  //         .delete();
  //     await firestore
  //         .collection('users')
  //         .doc(authController.user.uid)
  //         .collection('following')
  //         .doc(_uid.value)
  //         .delete();
  //     _user.value.update(
  //       'followers',
  //       (value) => (int.parse(value) - 1).toString(),
  //     );
  //   }
  //   _user.value.update('isFollowing', (value) => !value);
  //   update();
  // }
}
