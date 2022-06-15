// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      uid: json['uid'] as String,
      selectedTeamId: json['selectedTeamId'] as String?,
      teams: (json['teams'] as List<dynamic>?)
          ?.map((dynamic e) => e as String)
          .toList(),
      fullname: json['fullname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
      photoUrl: json['photoUrl'] as String?,
      lastUpdatedAt: json['lastUpdatedAt'] as int,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((dynamic e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'selectedTeamId': instance.selectedTeamId,
      'teams': instance.teams,
      'fullname': instance.fullname,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'lastUpdatedAt': instance.lastUpdatedAt,
      'roles': instance.roles,
    };
