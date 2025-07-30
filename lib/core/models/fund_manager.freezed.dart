// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fund_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FundManager _$FundManagerFromJson(Map<String, dynamic> json) {
  return _FundManager.fromJson(json);
}

/// @nodoc
mixin _$FundManager {
  int get userId => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  Profile get profile => throw _privateConstructorUsedError;

  /// Serializes this FundManager to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FundManager
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FundManagerCopyWith<FundManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FundManagerCopyWith<$Res> {
  factory $FundManagerCopyWith(
    FundManager value,
    $Res Function(FundManager) then,
  ) = _$FundManagerCopyWithImpl<$Res, FundManager>;
  @useResult
  $Res call({int userId, String firstName, String lastName, Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$FundManagerCopyWithImpl<$Res, $Val extends FundManager>
    implements $FundManagerCopyWith<$Res> {
  _$FundManagerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FundManager
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? profile = null,
  }) {
    return _then(
      _value.copyWith(
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as int,
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
            profile:
                null == profile
                    ? _value.profile
                    : profile // ignore: cast_nullable_to_non_nullable
                        as Profile,
          )
          as $Val,
    );
  }

  /// Create a copy of FundManager
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
abstract class _$$FundManagerImplCopyWith<$Res>
    implements $FundManagerCopyWith<$Res> {
  factory _$$FundManagerImplCopyWith(
    _$FundManagerImpl value,
    $Res Function(_$FundManagerImpl) then,
  ) = __$$FundManagerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, String firstName, String lastName, Profile profile});

  @override
  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$FundManagerImplCopyWithImpl<$Res>
    extends _$FundManagerCopyWithImpl<$Res, _$FundManagerImpl>
    implements _$$FundManagerImplCopyWith<$Res> {
  __$$FundManagerImplCopyWithImpl(
    _$FundManagerImpl _value,
    $Res Function(_$FundManagerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FundManager
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? profile = null,
  }) {
    return _then(
      _$FundManagerImpl(
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as int,
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
@JsonSerializable()
class _$FundManagerImpl implements _FundManager {
  const _$FundManagerImpl({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.profile,
  });

  factory _$FundManagerImpl.fromJson(Map<String, dynamic> json) =>
      _$$FundManagerImplFromJson(json);

  @override
  final int userId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final Profile profile;

  @override
  String toString() {
    return 'FundManager(userId: $userId, firstName: $firstName, lastName: $lastName, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FundManagerImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, firstName, lastName, profile);

  /// Create a copy of FundManager
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FundManagerImplCopyWith<_$FundManagerImpl> get copyWith =>
      __$$FundManagerImplCopyWithImpl<_$FundManagerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FundManagerImplToJson(this);
  }
}

abstract class _FundManager implements FundManager {
  const factory _FundManager({
    required final int userId,
    required final String firstName,
    required final String lastName,
    required final Profile profile,
  }) = _$FundManagerImpl;

  factory _FundManager.fromJson(Map<String, dynamic> json) =
      _$FundManagerImpl.fromJson;

  @override
  int get userId;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  Profile get profile;

  /// Create a copy of FundManager
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FundManagerImplCopyWith<_$FundManagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
