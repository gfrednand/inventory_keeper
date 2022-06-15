// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_keeper/src/models/permission/permission.dart';

part 'role.freezed.dart';
part 'role.g.dart';

@freezed
abstract class Role with _$Role {
  const factory Role({
    String? id,
    required String teamId,
    required String name,
    required int lastUpdatedAt,
    required List<Permission> permissions,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}
