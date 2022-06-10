// To parse this JSON data, do
//
//     final team = teamFromMap(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.freezed.dart';
part 'team.g.dart';

///
@freezed
class Team with _$Team {
  ///
  const factory Team({
    String? id,

    /// This is the name of the Team.
    /// It's required must not be null.
    required String name,
    required String userId,
    required int lastUpdatedAt,
  }) = _Team;

  ///
  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  // /// User from snapshot
  // Team? fromSnap(DocumentSnapshot snap) {
  //   if (snap.data() != null) {
  //     final snapshot = snap.data()! as Map<String, dynamic>;
  //     return Team(
  //       userId: snapshot['userId'] as String,
  //       name: snapshot['name'] as String,
  //       lastUpdatedAt: snapshot['lastUpdatedAt'] as int,
  //     );
  //   }

  //   return null;
  // }
}
