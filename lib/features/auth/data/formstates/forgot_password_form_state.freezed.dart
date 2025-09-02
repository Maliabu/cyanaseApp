// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForgotPasswordFormState _$ForgotPasswordFormStateFromJson(
    Map<String, dynamic> json) {
  return _ForgotPasswordFormState.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordFormState {
  int get step => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get emailError => throw _privateConstructorUsedError;
  String? get ref => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isPasswordVisible => throw _privateConstructorUsedError;
  bool get isConfirmPasswordVisible => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: ['', '', '', '', '', ''])
  List<String> get codeDigits => throw _privateConstructorUsedError;
  String get verificationCode => throw _privateConstructorUsedError;
  String? get codeError => throw _privateConstructorUsedError;
  String? get passwordError => throw _privateConstructorUsedError;
  String? get confirmPasswordError => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  AsyncValue<VerifyEmailResponse?>? get emailVerify =>
      throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  AsyncValue<SubmissionResponse?>? get submission =>
      throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForgotPasswordFormStateCopyWith<ForgotPasswordFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordFormStateCopyWith<$Res> {
  factory $ForgotPasswordFormStateCopyWith(ForgotPasswordFormState value,
          $Res Function(ForgotPasswordFormState) then) =
      _$ForgotPasswordFormStateCopyWithImpl<$Res, ForgotPasswordFormState>;
  @useResult
  $Res call(
      {int step,
      String email,
      String? emailError,
      String? ref,
      String password,
      bool isPasswordVisible,
      bool isConfirmPasswordVisible,
      @JsonKey(defaultValue: ['', '', '', '', '', '']) List<String> codeDigits,
      String verificationCode,
      String? codeError,
      String? passwordError,
      String? confirmPasswordError,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<VerifyEmailResponse?>? emailVerify,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<SubmissionResponse?>? submission,
      String confirmPassword});
}

/// @nodoc
class _$ForgotPasswordFormStateCopyWithImpl<$Res,
        $Val extends ForgotPasswordFormState>
    implements $ForgotPasswordFormStateCopyWith<$Res> {
  _$ForgotPasswordFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? email = null,
    Object? emailError = freezed,
    Object? ref = freezed,
    Object? password = null,
    Object? isPasswordVisible = null,
    Object? isConfirmPasswordVisible = null,
    Object? codeDigits = null,
    Object? verificationCode = null,
    Object? codeError = freezed,
    Object? passwordError = freezed,
    Object? confirmPasswordError = freezed,
    Object? emailVerify = freezed,
    Object? submission = freezed,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String?,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordVisible: null == isConfirmPasswordVisible
          ? _value.isConfirmPasswordVisible
          : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      codeDigits: null == codeDigits
          ? _value.codeDigits
          : codeDigits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      codeError: freezed == codeError
          ? _value.codeError
          : codeError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPasswordError: freezed == confirmPasswordError
          ? _value.confirmPasswordError
          : confirmPasswordError // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerify: freezed == emailVerify
          ? _value.emailVerify
          : emailVerify // ignore: cast_nullable_to_non_nullable
              as AsyncValue<VerifyEmailResponse?>?,
      submission: freezed == submission
          ? _value.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SubmissionResponse?>?,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPasswordFormStateImplCopyWith<$Res>
    implements $ForgotPasswordFormStateCopyWith<$Res> {
  factory _$$ForgotPasswordFormStateImplCopyWith(
          _$ForgotPasswordFormStateImpl value,
          $Res Function(_$ForgotPasswordFormStateImpl) then) =
      __$$ForgotPasswordFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int step,
      String email,
      String? emailError,
      String? ref,
      String password,
      bool isPasswordVisible,
      bool isConfirmPasswordVisible,
      @JsonKey(defaultValue: ['', '', '', '', '', '']) List<String> codeDigits,
      String verificationCode,
      String? codeError,
      String? passwordError,
      String? confirmPasswordError,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<VerifyEmailResponse?>? emailVerify,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<SubmissionResponse?>? submission,
      String confirmPassword});
}

/// @nodoc
class __$$ForgotPasswordFormStateImplCopyWithImpl<$Res>
    extends _$ForgotPasswordFormStateCopyWithImpl<$Res,
        _$ForgotPasswordFormStateImpl>
    implements _$$ForgotPasswordFormStateImplCopyWith<$Res> {
  __$$ForgotPasswordFormStateImplCopyWithImpl(
      _$ForgotPasswordFormStateImpl _value,
      $Res Function(_$ForgotPasswordFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? email = null,
    Object? emailError = freezed,
    Object? ref = freezed,
    Object? password = null,
    Object? isPasswordVisible = null,
    Object? isConfirmPasswordVisible = null,
    Object? codeDigits = null,
    Object? verificationCode = null,
    Object? codeError = freezed,
    Object? passwordError = freezed,
    Object? confirmPasswordError = freezed,
    Object? emailVerify = freezed,
    Object? submission = freezed,
    Object? confirmPassword = null,
  }) {
    return _then(_$ForgotPasswordFormStateImpl(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String?,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordVisible: null == isConfirmPasswordVisible
          ? _value.isConfirmPasswordVisible
          : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      codeDigits: null == codeDigits
          ? _value._codeDigits
          : codeDigits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      codeError: freezed == codeError
          ? _value.codeError
          : codeError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPasswordError: freezed == confirmPasswordError
          ? _value.confirmPasswordError
          : confirmPasswordError // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerify: freezed == emailVerify
          ? _value.emailVerify
          : emailVerify // ignore: cast_nullable_to_non_nullable
              as AsyncValue<VerifyEmailResponse?>?,
      submission: freezed == submission
          ? _value.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SubmissionResponse?>?,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPasswordFormStateImpl implements _ForgotPasswordFormState {
  const _$ForgotPasswordFormStateImpl(
      {required this.step,
      required this.email,
      this.emailError,
      this.ref,
      required this.password,
      required this.isPasswordVisible,
      required this.isConfirmPasswordVisible,
      @JsonKey(defaultValue: ['', '', '', '', '', ''])
      final List<String> codeDigits = const ['', '', '', '', '', ''],
      required this.verificationCode,
      this.codeError,
      this.passwordError,
      this.confirmPasswordError,
      @JsonKey(includeFromJson: false, includeToJson: false) this.emailVerify,
      @JsonKey(includeFromJson: false, includeToJson: false) this.submission,
      required this.confirmPassword})
      : _codeDigits = codeDigits;

  factory _$ForgotPasswordFormStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgotPasswordFormStateImplFromJson(json);

  @override
  final int step;
  @override
  final String email;
  @override
  final String? emailError;
  @override
  final String? ref;
  @override
  final String password;
  @override
  final bool isPasswordVisible;
  @override
  final bool isConfirmPasswordVisible;
  final List<String> _codeDigits;
  @override
  @JsonKey(defaultValue: ['', '', '', '', '', ''])
  List<String> get codeDigits {
    if (_codeDigits is EqualUnmodifiableListView) return _codeDigits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_codeDigits);
  }

  @override
  final String verificationCode;
  @override
  final String? codeError;
  @override
  final String? passwordError;
  @override
  final String? confirmPasswordError;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final AsyncValue<VerifyEmailResponse?>? emailVerify;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final AsyncValue<SubmissionResponse?>? submission;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'ForgotPasswordFormState(step: $step, email: $email, emailError: $emailError, ref: $ref, password: $password, isPasswordVisible: $isPasswordVisible, isConfirmPasswordVisible: $isConfirmPasswordVisible, codeDigits: $codeDigits, verificationCode: $verificationCode, codeError: $codeError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, emailVerify: $emailVerify, submission: $submission, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordFormStateImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(
                    other.isConfirmPasswordVisible, isConfirmPasswordVisible) ||
                other.isConfirmPasswordVisible == isConfirmPasswordVisible) &&
            const DeepCollectionEquality()
                .equals(other._codeDigits, _codeDigits) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.codeError, codeError) ||
                other.codeError == codeError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.confirmPasswordError, confirmPasswordError) ||
                other.confirmPasswordError == confirmPasswordError) &&
            (identical(other.emailVerify, emailVerify) ||
                other.emailVerify == emailVerify) &&
            (identical(other.submission, submission) ||
                other.submission == submission) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      step,
      email,
      emailError,
      ref,
      password,
      isPasswordVisible,
      isConfirmPasswordVisible,
      const DeepCollectionEquality().hash(_codeDigits),
      verificationCode,
      codeError,
      passwordError,
      confirmPasswordError,
      emailVerify,
      submission,
      confirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordFormStateImplCopyWith<_$ForgotPasswordFormStateImpl>
      get copyWith => __$$ForgotPasswordFormStateImplCopyWithImpl<
          _$ForgotPasswordFormStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordFormStateImplToJson(
      this,
    );
  }
}

abstract class _ForgotPasswordFormState implements ForgotPasswordFormState {
  const factory _ForgotPasswordFormState(
      {required final int step,
      required final String email,
      final String? emailError,
      final String? ref,
      required final String password,
      required final bool isPasswordVisible,
      required final bool isConfirmPasswordVisible,
      @JsonKey(defaultValue: ['', '', '', '', '', ''])
      final List<String> codeDigits,
      required final String verificationCode,
      final String? codeError,
      final String? passwordError,
      final String? confirmPasswordError,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final AsyncValue<VerifyEmailResponse?>? emailVerify,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final AsyncValue<SubmissionResponse?>? submission,
      required final String confirmPassword}) = _$ForgotPasswordFormStateImpl;

  factory _ForgotPasswordFormState.fromJson(Map<String, dynamic> json) =
      _$ForgotPasswordFormStateImpl.fromJson;

  @override
  int get step;
  @override
  String get email;
  @override
  String? get emailError;
  @override
  String? get ref;
  @override
  String get password;
  @override
  bool get isPasswordVisible;
  @override
  bool get isConfirmPasswordVisible;
  @override
  @JsonKey(defaultValue: ['', '', '', '', '', ''])
  List<String> get codeDigits;
  @override
  String get verificationCode;
  @override
  String? get codeError;
  @override
  String? get passwordError;
  @override
  String? get confirmPasswordError;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  AsyncValue<VerifyEmailResponse?>? get emailVerify;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  AsyncValue<SubmissionResponse?>? get submission;
  @override
  String get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$ForgotPasswordFormStateImplCopyWith<_$ForgotPasswordFormStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
