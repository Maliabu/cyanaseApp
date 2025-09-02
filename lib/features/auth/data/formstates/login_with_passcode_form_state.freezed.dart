// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_with_passcode_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginWithPasscodeFormState _$LoginWithPasscodeFormStateFromJson(
    Map<String, dynamic> json) {
  return _LoginWithPasscodeFormState.fromJson(json);
}

/// @nodoc
mixin _$LoginWithPasscodeFormState {
// we are submitting a passcode so
// only serializable we need to send to django
  String get passcode =>
      throw _privateConstructorUsedError; // django will probably return sth so
// we probably need a login response model
// unless we have a reusable one like the signup response
  @JsonKey(includeFromJson: false, includeToJson: false)
  AsyncValue<SignUpResponse?> get loginResponse =>
      throw _privateConstructorUsedError; // during submission
  @JsonKey(includeFromJson: false, includeToJson: false)
  AsyncValue<SubmissionResponse?> get submission =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginWithPasscodeFormStateCopyWith<LoginWithPasscodeFormState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginWithPasscodeFormStateCopyWith<$Res> {
  factory $LoginWithPasscodeFormStateCopyWith(LoginWithPasscodeFormState value,
          $Res Function(LoginWithPasscodeFormState) then) =
      _$LoginWithPasscodeFormStateCopyWithImpl<$Res,
          LoginWithPasscodeFormState>;
  @useResult
  $Res call(
      {String passcode,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<SignUpResponse?> loginResponse,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<SubmissionResponse?> submission});
}

/// @nodoc
class _$LoginWithPasscodeFormStateCopyWithImpl<$Res,
        $Val extends LoginWithPasscodeFormState>
    implements $LoginWithPasscodeFormStateCopyWith<$Res> {
  _$LoginWithPasscodeFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passcode = null,
    Object? loginResponse = null,
    Object? submission = null,
  }) {
    return _then(_value.copyWith(
      passcode: null == passcode
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as String,
      loginResponse: null == loginResponse
          ? _value.loginResponse
          : loginResponse // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SignUpResponse?>,
      submission: null == submission
          ? _value.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SubmissionResponse?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginWithPasscodeFormStateImplCopyWith<$Res>
    implements $LoginWithPasscodeFormStateCopyWith<$Res> {
  factory _$$LoginWithPasscodeFormStateImplCopyWith(
          _$LoginWithPasscodeFormStateImpl value,
          $Res Function(_$LoginWithPasscodeFormStateImpl) then) =
      __$$LoginWithPasscodeFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String passcode,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<SignUpResponse?> loginResponse,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<SubmissionResponse?> submission});
}

/// @nodoc
class __$$LoginWithPasscodeFormStateImplCopyWithImpl<$Res>
    extends _$LoginWithPasscodeFormStateCopyWithImpl<$Res,
        _$LoginWithPasscodeFormStateImpl>
    implements _$$LoginWithPasscodeFormStateImplCopyWith<$Res> {
  __$$LoginWithPasscodeFormStateImplCopyWithImpl(
      _$LoginWithPasscodeFormStateImpl _value,
      $Res Function(_$LoginWithPasscodeFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passcode = null,
    Object? loginResponse = null,
    Object? submission = null,
  }) {
    return _then(_$LoginWithPasscodeFormStateImpl(
      passcode: null == passcode
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as String,
      loginResponse: null == loginResponse
          ? _value.loginResponse
          : loginResponse // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SignUpResponse?>,
      submission: null == submission
          ? _value.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SubmissionResponse?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginWithPasscodeFormStateImpl implements _LoginWithPasscodeFormState {
  const _$LoginWithPasscodeFormStateImpl(
      {this.passcode = '',
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.loginResponse = const AsyncData(null),
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.submission = const AsyncData(null)});

  factory _$LoginWithPasscodeFormStateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$LoginWithPasscodeFormStateImplFromJson(json);

// we are submitting a passcode so
// only serializable we need to send to django
  @override
  @JsonKey()
  final String passcode;
// django will probably return sth so
// we probably need a login response model
// unless we have a reusable one like the signup response
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final AsyncValue<SignUpResponse?> loginResponse;
// during submission
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final AsyncValue<SubmissionResponse?> submission;

  @override
  String toString() {
    return 'LoginWithPasscodeFormState(passcode: $passcode, loginResponse: $loginResponse, submission: $submission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithPasscodeFormStateImpl &&
            (identical(other.passcode, passcode) ||
                other.passcode == passcode) &&
            (identical(other.loginResponse, loginResponse) ||
                other.loginResponse == loginResponse) &&
            (identical(other.submission, submission) ||
                other.submission == submission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, passcode, loginResponse, submission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithPasscodeFormStateImplCopyWith<_$LoginWithPasscodeFormStateImpl>
      get copyWith => __$$LoginWithPasscodeFormStateImplCopyWithImpl<
          _$LoginWithPasscodeFormStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginWithPasscodeFormStateImplToJson(
      this,
    );
  }
}

abstract class _LoginWithPasscodeFormState
    implements LoginWithPasscodeFormState {
  const factory _LoginWithPasscodeFormState(
          {final String passcode,
          @JsonKey(includeFromJson: false, includeToJson: false)
          final AsyncValue<SignUpResponse?> loginResponse,
          @JsonKey(includeFromJson: false, includeToJson: false)
          final AsyncValue<SubmissionResponse?> submission}) =
      _$LoginWithPasscodeFormStateImpl;

  factory _LoginWithPasscodeFormState.fromJson(Map<String, dynamic> json) =
      _$LoginWithPasscodeFormStateImpl.fromJson;

  @override // we are submitting a passcode so
// only serializable we need to send to django
  String get passcode;
  @override // django will probably return sth so
// we probably need a login response model
// unless we have a reusable one like the signup response
  @JsonKey(includeFromJson: false, includeToJson: false)
  AsyncValue<SignUpResponse?> get loginResponse;
  @override // during submission
  @JsonKey(includeFromJson: false, includeToJson: false)
  AsyncValue<SubmissionResponse?> get submission;
  @override
  @JsonKey(ignore: true)
  _$$LoginWithPasscodeFormStateImplCopyWith<_$LoginWithPasscodeFormStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
