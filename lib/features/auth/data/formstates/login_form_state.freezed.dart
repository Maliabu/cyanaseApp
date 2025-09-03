// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginFormState _$LoginFormStateFromJson(Map<String, dynamic> json) {
  return _LoginFormState.fromJson(json);
}

/// @nodoc
mixin _$LoginFormState {
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get phoneError => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get passwordError => throw _privateConstructorUsedError;
  bool get isPasswordVisible => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  AsyncValue<SubmissionResponse?>? get submission =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginFormStateCopyWith<LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormStateCopyWith<$Res> {
  factory $LoginFormStateCopyWith(
          LoginFormState value, $Res Function(LoginFormState) then) =
      _$LoginFormStateCopyWithImpl<$Res, LoginFormState>;
  @useResult
  $Res call(
      {String phoneNumber,
      String? phoneError,
      String password,
      String? passwordError,
      bool isPasswordVisible,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<SubmissionResponse?>? submission});
}

/// @nodoc
class _$LoginFormStateCopyWithImpl<$Res, $Val extends LoginFormState>
    implements $LoginFormStateCopyWith<$Res> {
  _$LoginFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? phoneError = freezed,
    Object? password = null,
    Object? passwordError = freezed,
    Object? isPasswordVisible = null,
    Object? submission = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      phoneError: freezed == phoneError
          ? _value.phoneError
          : phoneError // ignore: cast_nullable_to_non_nullable
              as String?,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      submission: freezed == submission
          ? _value.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SubmissionResponse?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginFormStateImplCopyWith<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  factory _$$LoginFormStateImplCopyWith(_$LoginFormStateImpl value,
          $Res Function(_$LoginFormStateImpl) then) =
      __$$LoginFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String phoneNumber,
      String? phoneError,
      String password,
      String? passwordError,
      bool isPasswordVisible,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<SubmissionResponse?>? submission});
}

/// @nodoc
class __$$LoginFormStateImplCopyWithImpl<$Res>
    extends _$LoginFormStateCopyWithImpl<$Res, _$LoginFormStateImpl>
    implements _$$LoginFormStateImplCopyWith<$Res> {
  __$$LoginFormStateImplCopyWithImpl(
      _$LoginFormStateImpl _value, $Res Function(_$LoginFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? phoneError = freezed,
    Object? password = null,
    Object? passwordError = freezed,
    Object? isPasswordVisible = null,
    Object? submission = freezed,
  }) {
    return _then(_$LoginFormStateImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      phoneError: freezed == phoneError
          ? _value.phoneError
          : phoneError // ignore: cast_nullable_to_non_nullable
              as String?,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      submission: freezed == submission
          ? _value.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SubmissionResponse?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginFormStateImpl implements _LoginFormState {
  const _$LoginFormStateImpl(
      {this.phoneNumber = '+256',
      this.phoneError = null,
      this.password = '',
      this.passwordError = null,
      this.isPasswordVisible = false,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.submission = null});

  factory _$LoginFormStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginFormStateImplFromJson(json);

  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String? phoneError;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String? passwordError;
  @override
  @JsonKey()
  final bool isPasswordVisible;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final AsyncValue<SubmissionResponse?>? submission;

  @override
  String toString() {
    return 'LoginFormState(phoneNumber: $phoneNumber, phoneError: $phoneError, password: $password, passwordError: $passwordError, isPasswordVisible: $isPasswordVisible, submission: $submission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFormStateImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.phoneError, phoneError) ||
                other.phoneError == phoneError) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(other.submission, submission) ||
                other.submission == submission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, phoneError,
      password, passwordError, isPasswordVisible, submission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginFormStateImplCopyWith<_$LoginFormStateImpl> get copyWith =>
      __$$LoginFormStateImplCopyWithImpl<_$LoginFormStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginFormStateImplToJson(
      this,
    );
  }
}

abstract class _LoginFormState implements LoginFormState {
  const factory _LoginFormState(
          {final String phoneNumber,
          final String? phoneError,
          final String password,
          final String? passwordError,
          final bool isPasswordVisible,
          @JsonKey(includeFromJson: false, includeToJson: false)
          final AsyncValue<SubmissionResponse?>? submission}) =
      _$LoginFormStateImpl;

  factory _LoginFormState.fromJson(Map<String, dynamic> json) =
      _$LoginFormStateImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  String? get phoneError;
  @override
  String get password;
  @override
  String? get passwordError;
  @override
  bool get isPasswordVisible;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  AsyncValue<SubmissionResponse?>? get submission;
  @override
  @JsonKey(ignore: true)
  _$$LoginFormStateImplCopyWith<_$LoginFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
