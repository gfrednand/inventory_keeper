import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission.freezed.dart';
part 'permission.g.dart';

///
@freezed
abstract class Permission with _$Permission {
  const factory Permission({
    String? id,
    required String name,
    required bool active,
  }) = _Permission;

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);
}
