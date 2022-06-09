import 'package:cloud_firestore/cloud_firestore.dart';

/// User definition
class User {
  ///
  User({
    required this.name,
    required this.email,
    required this.uid,
    required this.profilePhoto,
    required int lastUpdatedAt,
  });

  ///

  ///
  String name;

  ///
  String profilePhoto;

  ///
  String email;

  ///
  String uid;

  /// User to Jspn
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'profilePhoto': profilePhoto,
        'email': email,
        'uid': uid,
      };

  /// User from snapshot
  User? fromSnap(DocumentSnapshot snap) {
    if (snap.data() != null) {
      final snapshot = snap.data()! as Map<String, dynamic>;
      return User(
        email: snapshot['email'] as String,
        profilePhoto: snapshot['profilePhoto'] as String,
        uid: snapshot['uid'] as String,
        name: snapshot['name'] as String,
      );
    }

    return null;
  }
}
