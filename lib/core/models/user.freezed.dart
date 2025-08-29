// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get token => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  bool get isSuperuser => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  DateTime? get lastLogin => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  bool get isStaff => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get dateJoined => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  Profile get profile => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({
    String token,
    String username,
    int userId,
    bool isSuperuser,
    String email,
    DateTime? lastLogin,
    String firstName,
    String lastName,
    bool isStaff,
    bool isActive,
    DateTime dateJoined,
    String? message,
    bool success,
    Profile profile,
  });

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? username = null,
    Object? userId = null,
    Object? isSuperuser = null,
    Object? email = null,
    Object? lastLogin = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? isStaff = null,
    Object? isActive = null,
    Object? dateJoined = null,
    Object? message = freezed,
    Object? success = null,
    Object? profile = null,
  }) {
    return _then(
      _value.copyWith(
            token:
                null == token
                    ? _value.token
                    : token // ignore: cast_nullable_to_non_nullable
                        as String,
            username:
                null == username
                    ? _value.username
                    : username // ignore: cast_nullable_to_non_nullable
                        as String,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as int,
            isSuperuser:
                null == isSuperuser
                    ? _value.isSuperuser
                    : isSuperuser // ignore: cast_nullable_to_non_nullable
                        as bool,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            lastLogin:
                freezed == lastLogin
                    ? _value.lastLogin
                    : lastLogin // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            firstName:
                null == firstName
                    ? _value.firstName
                    : firstName // ignore: cast_nullable_to_non_nullable
                        as String,
            lastName:
                null == lastName
                    ? _value.lastName
                    : lastName // ignore: cast_nullable_to_non_nullable
                        as String,
            isStaff:
                null == isStaff
                    ? _value.isStaff
                    : isStaff // ignore: cast_nullable_to_non_nullable
                        as bool,
            isActive:
                null == isActive
                    ? _value.isActive
                    : isActive // ignore: cast_nullable_to_non_nullable
                        as bool,
            dateJoined:
                null == dateJoined
                    ? _value.dateJoined
                    : dateJoined // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
            success:
                null == success
                    ? _value.success
                    : success // ignore: cast_nullable_to_non_nullable
                        as bool,
            profile:
                null == profile
                    ? _value.profile
                    : profile // ignore: cast_nullable_to_non_nullable
                        as Profile,
          )
          as $Val,
    );
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
    _$UserImpl value,
    $Res Function(_$UserImpl) then,
  ) = __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String token,
    String username,
    int userId,
    bool isSuperuser,
    String email,
    DateTime? lastLogin,
    String firstName,
    String lastName,
    bool isStaff,
    bool isActive,
    DateTime dateJoined,
    String? message,
    bool success,
    Profile profile,
  });

  @override
  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
    : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? username = null,
    Object? userId = null,
    Object? isSuperuser = null,
    Object? email = null,
    Object? lastLogin = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? isStaff = null,
    Object? isActive = null,
    Object? dateJoined = null,
    Object? message = freezed,
    Object? success = null,
    Object? profile = null,
  }) {
    return _then(
      _$UserImpl(
        token:
            null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String,
        username:
            null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as int,
        isSuperuser:
            null == isSuperuser
                ? _value.isSuperuser
                : isSuperuser // ignore: cast_nullable_to_non_nullable
                    as bool,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        lastLogin:
            freezed == lastLogin
                ? _value.lastLogin
                : lastLogin // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        firstName:
            null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                    as String,
        lastName:
            null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                    as String,
        isStaff:
            null == isStaff
                ? _value.isStaff
                : isStaff // ignore: cast_nullable_to_non_nullable
                    as bool,
        isActive:
            null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                    as bool,
        dateJoined:
            null == dateJoined
                ? _value.dateJoined
                : dateJoined // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
        profile:
            null == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                    as Profile,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UserImpl implements _User {
  const _$UserImpl({
    required this.token,
    required this.username,
    required this.userId,
    required this.isSuperuser,
    required this.email,
    this.lastLogin,
    required this.firstName,
    required this.lastName,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    this.message,
    required this.success,
    required this.profile,
  });

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String token;
  @override
  final String username;
  @override
  final int userId;
  @override
  final bool isSuperuser;
  @override
  final String email;
  @override
  final DateTime? lastLogin;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final bool isStaff;
  @override
  final bool isActive;
  @override
  final DateTime dateJoined;
  @override
  final String? message;
  @override
  final bool success;
  @override
  final Profile profile;

  @override
  String toString() {
    return 'User(token: $token, username: $username, userId: $userId, isSuperuser: $isSuperuser, email: $email, lastLogin: $lastLogin, firstName: $firstName, lastName: $lastName, isStaff: $isStaff, isActive: $isActive, dateJoined: $dateJoined, message: $message, success: $success, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isSuperuser, isSuperuser) ||
                other.isSuperuser == isSuperuser) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.isStaff, isStaff) || other.isStaff == isStaff) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.dateJoined, dateJoined) ||
                other.dateJoined == dateJoined) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    token,
    username,
    userId,
    isSuperuser,
    email,
    lastLogin,
    firstName,
    lastName,
    isStaff,
    isActive,
    dateJoined,
    message,
    success,
    profile,
  );

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(this);
  }
}

abstract class _User implements User {
  const factory _User({
    required final String token,
    required final String username,
    required final int userId,
    required final bool isSuperuser,
    required final String email,
    final DateTime? lastLogin,
    required final String firstName,
    required final String lastName,
    required final bool isStaff,
    required final bool isActive,
    required final DateTime dateJoined,
    final String? message,
    required final bool success,
    required final Profile profile,
  }) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get token;
  @override
  String get username;
  @override
  int get userId;
  @override
  bool get isSuperuser;
  @override
  String get email;
  @override
  DateTime? get lastLogin;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  bool get isStaff;
  @override
  bool get isActive;
  @override
  DateTime get dateJoined;
  @override
  String? get message;
  @override
  bool get success;
  @override
  Profile get profile;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
