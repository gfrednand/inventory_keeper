// To parse this JSON data, do
//

// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_keeper/src/models/role/role.dart';
import 'package:inventory_keeper/src/models/team/team.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    String? id,
    required String uid,
    String? selectedTeamId,
    List<String>? teams,
    required String fullname,
    required String phoneNumber,
    String? email,
    String? photoUrl,
    required int lastUpdatedAt,
    List<Role>? roles,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
