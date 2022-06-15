import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/auth/login_screen.dart';
import 'package:inventory_keeper/src/controllers/base_controller.dart';
import 'package:inventory_keeper/src/models/user/user.dart';
import 'package:inventory_keeper/src/utility/firestore_constant.dart';

/// User Controlelr
class UserController extends BaseController {
  /// User constroller instance
  static UserController instance = Get.find();

  ///
  static User dummyUser = const User(
    uid: 'uid',
    fullname: 'demo user',
    phoneNumber: '12345678',
    lastUpdatedAt: 0,
  );

  ///
  List<User> _users = [];

  ///
  List<User> get users => _users;

  ///
  final RxInt _lastUpdatedAt = 0.obs;

  /// Last Updated At
  int get lastUpdatedAt => _lastUpdatedAt.value;

  /// Set Last Updated At
  set lastUpdatedAt(int value) {
    _lastUpdatedAt(value);
  }

  /// User
  User? get user => userRx.value;

  ///
  String? get _uid => box.read('loggedInUserId');

  ///
  Rx<User?> userRx = Rx(dummyUser);

  @override
  void onReady() {
    super.onReady();
    userRx.bindStream(getUserDetails());
    ever(userRx, getUserData);
    ever(_lastUpdatedAt, fetchData);
  }

  ///
  Stream<User?> getUserDetails() {
    return usersCollectionRef.doc(_uid).snapshots().map<User?>(
          (snapshot) => snapshot.data() != null
              ? User.fromJson(snapshot.data()! as Map<String, dynamic>)
              : null,
        );
  }

  /// Future Items
  Future<void> fetchData(int? lastUpdatedAt) async {
    final datas = <User>[];
    QuerySnapshot<Object?> snapShot;
    busy = true;
    if (teamId != null) {
      if (lastUpdatedAt != null) {
        snapShot = await partnerCollectionRef(teamId!)
            .where('lastUpdatedAt', isEqualTo: lastUpdatedAt)
            .get();
      } else {
        snapShot = await partnerCollectionRef(teamId!).get();
      }
      for (final doc in snapShot.docs) {
        final json = doc.data()! as Map<String, dynamic>;
        json['id'] = doc.id;
        datas.add(User.fromJson(json));
      }
      _users = datas;
    }

    busy = false;
  }

  ///
  Future<void> checkByPhoneNumber(String phoneNumber) async {
    busy = true;
    final snapshot = await usersCollectionRef
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();
    if (snapshot.docs.isNotEmpty) {
      userRx.value =
          User.fromJson(snapshot.docs[0].data()! as Map<String, dynamic>);
    }
    if (userRx.value == null) {
      Get.snackbar(
        'Oops',
        'Phone number does not exist, please regiser',
        colorText: Colors.red,
        // forwardAnimationCurve: Curves.easeOutBack,
        // snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      await box.write('selectedTeamId', userRx.value?.selectedTeamId);
      await Get.to<void>(LoginScreen(phoneNumber: phoneNumber));
    }
    busy = false;
  }

  ///
  void getUserData(User? user) {
    // final thumbnails = <String>[];
    // final myVideos = await firestore
    //     .collection('videos')
    //     .where('uid', isEqualTo: _uid.value)
    //     .get();
    box.write('selectedTeamId', user?.selectedTeamId);

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
    // }

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
    // update();
  }
}
