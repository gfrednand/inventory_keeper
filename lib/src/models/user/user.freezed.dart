// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String? get selectedTeamUid => throw _privateConstructorUsedError;
  List<Team>? get teams => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  int get lastUpdatedAt => throw _privateConstructorUsedError;
  List<Role>? get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String uid,
      String? selectedTeamUid,
      List<Team>? teams,
      String fullname,
      String phoneNumber,
      String? email,
      String? photoUrl,
      int lastUpdatedAt,
      List<Role>? roles});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? selectedTeamUid = freezed,
    Object? teams = freezed,
    Object? fullname = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? photoUrl = freezed,
    Object? lastUpdatedAt = freezed,
    Object? roles = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTeamUid: selectedTeamUid == freezed
          ? _value.selectedTeamUid
          : selectedTeamUid // ignore: cast_nullable_to_non_nullable
              as String?,
      teams: teams == freezed
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>?,
      fullname: fullname == freezed
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      roles: roles == freezed
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String uid,
      String? selectedTeamUid,
      List<Team>? teams,
      String fullname,
      String phoneNumber,
      String? email,
      String? photoUrl,
      int lastUpdatedAt,
      List<Role>? roles});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? selectedTeamUid = freezed,
    Object? teams = freezed,
    Object? fullname = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? photoUrl = freezed,
    Object? lastUpdatedAt = freezed,
    Object? roles = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTeamUid: selectedTeamUid == freezed
          ? _value.selectedTeamUid
          : selectedTeamUid // ignore: cast_nullable_to_non_nullable
              as String?,
      teams: teams == freezed
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>?,
      fullname: fullname == freezed
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      roles: roles == freezed
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {this.id,
      required this.uid,
      this.selectedTeamUid,
      final List<Team>? teams,
      required this.fullname,
      required this.phoneNumber,
      this.email,
      this.photoUrl,
      required this.lastUpdatedAt,
      final List<Role>? roles})
      : _teams = teams,
        _roles = roles;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String? id;
  @override
  final String uid;
  @override
  final String? selectedTeamUid;
  final List<Team>? _teams;
  @override
  List<Team>? get teams {
    final value = _teams;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String fullname;
  @override
  final String phoneNumber;
  @override
  final String? email;
  @override
  final String? photoUrl;
  @override
  final int lastUpdatedAt;
  final List<Role>? _roles;
  @override
  List<Role>? get roles {
    final value = _roles;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'User(id: $id, uid: $uid, selectedTeamUid: $selectedTeamUid, teams: $teams, fullname: $fullname, phoneNumber: $phoneNumber, email: $email, photoUrl: $photoUrl, lastUpdatedAt: $lastUpdatedAt, roles: $roles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.selectedTeamUid, selectedTeamUid) &&
            const DeepCollectionEquality().equals(other._teams, _teams) &&
            const DeepCollectionEquality().equals(other.fullname, fullname) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdatedAt, lastUpdatedAt) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(selectedTeamUid),
      const DeepCollectionEquality().hash(_teams),
      const DeepCollectionEquality().hash(fullname),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(lastUpdatedAt),
      const DeepCollectionEquality().hash(_roles));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {final String? id,
      required final String uid,
      final String? selectedTeamUid,
      final List<Team>? teams,
      required final String fullname,
      required final String phoneNumber,
      final String? email,
      final String? photoUrl,
      required final int lastUpdatedAt,
      final List<Role>? roles}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String? get selectedTeamUid => throw _privateConstructorUsedError;
  @override
  List<Team>? get teams => throw _privateConstructorUsedError;
  @override
  String get fullname => throw _privateConstructorUsedError;
  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get photoUrl => throw _privateConstructorUsedError;
  @override
  int get lastUpdatedAt => throw _privateConstructorUsedError;
  @override
  List<Role>? get roles => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
