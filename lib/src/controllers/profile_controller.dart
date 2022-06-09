import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/utility/app_constants.dart';

/// Profile Controlelr
class ProfileController extends GetxController {
  final Rx<Map<String, dynamic>> _user =
      Rx<Map<String, dynamic>>(<String, dynamic>{});

  ///
  Map<String, dynamic> get user => _user.value;

  final Rx<String> _uid = ''.obs;

  /// Update user Id
  void updateUserId({String? uid}) {
    var userUid = firebaseAuth.currentUser!.uid;

    print(userUid);
    if (uid != null) {
      userUid = uid;
    }
    _uid.value = userUid;
    getUserData();
  }

  ///
  Future<void> getUserData() async {
    // final thumbnails = <String>[];
    // final myVideos = await firestore
    //     .collection('videos')
    //     .where('uid', isEqualTo: _uid.value)
    //     .get();

    final DocumentSnapshot userDoc =
        await firestore.collection('users').doc(_uid.value).get();
    if (userDoc.data() != null) {
      final userData = userDoc.data()! as Map<String, dynamic>;
      final name = userData['name'] as String;
      final profilePhoto = userData['profilePhoto'] as String;

      _user.value = <String, dynamic>{
        // 'followers': followers.toString(),
        // 'following': following.toString(),
        // 'isFollowing': isFollowing,
        // 'likes': likes.toString(),
        'profilePhoto': profilePhoto,
        'name': name,
        // 'thumbnails': thumbnails,
      };
      update();
    }

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
