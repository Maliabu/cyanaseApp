// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerificationCode {
  String get verificationCode => throw _privateConstructorUsedError;
  AsyncValue<SubmissionResponse?> get submission =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerificationCodeCopyWith<VerificationCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationCodeCopyWith<$Res> {
  factory $VerificationCodeCopyWith(
          VerificationCode value, $Res Function(VerificationCode) then) =
      _$VerificationCodeCopyWithImpl<$Res, VerificationCode>;
  @useResult
  $Res call(
      {String verificationCode, AsyncValue<SubmissionResponse?> submission});
}

/// @nodoc
class _$VerificationCodeCopyWithImpl<$Res, $Val extends VerificationCode>
    implements $VerificationCodeCopyWith<$Res> {
  _$VerificationCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationCode = null,
    Object? submission = null,
  }) {
    return _then(_value.copyWith(
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      submission: null == submission
          ? _value.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SubmissionResponse?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationCodeImplCopyWith<$Res>
    implements $VerificationCodeCopyWith<$Res> {
  factory _$$VerificationCodeImplCopyWith(_$VerificationCodeImpl value,
          $Res Function(_$VerificationCodeImpl) then) =
      __$$VerificationCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String verificationCode, AsyncValue<SubmissionResponse?> submission});
}

/// @nodoc
class __$$VerificationCodeImplCopyWithImpl<$Res>
    extends _$VerificationCodeCopyWithImpl<$Res, _$VerificationCodeImpl>
    implements _$$VerificationCodeImplCopyWith<$Res> {
  __$$VerificationCodeImplCopyWithImpl(_$VerificationCodeImpl _value,
      $Res Function(_$VerificationCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationCode = null,
    Object? submission = null,
  }) {
    return _then(_$VerificationCodeImpl(
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      submission: null == submission
          ? _value.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SubmissionResponse?>,
    ));
  }
}

/// @nodoc

class _$VerificationCodeImpl implements _VerificationCode {
  const _$VerificationCodeImpl(
      {required this.verificationCode,
      this.submission = const AsyncData<SubmissionResponse?>(null)});

  @override
  final String verificationCode;
  @override
  @JsonKey()
  final AsyncValue<SubmissionResponse?> submission;

  @override
  String toString() {
    return 'VerificationCode(verificationCode: $verificationCode, submission: $submission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationCodeImpl &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.submission, submission) ||
                other.submission == submission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationCode, submission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationCodeImplCopyWith<_$VerificationCodeImpl> get copyWith =>
      __$$VerificationCodeImplCopyWithImpl<_$VerificationCodeImpl>(
          this, _$identity);
}

abstract class _VerificationCode implements VerificationCode {
  const factory _VerificationCode(
          {required final String verificationCode,
          final AsyncValue<SubmissionResponse?> submission}) =
      _$VerificationCodeImpl;

  @override
  String get verificationCode;
  @override
  AsyncValue<SubmissionResponse?> get submission;
  @override
  @JsonKey(ignore: true)
  _$$VerificationCodeImplCopyWith<_$VerificationCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
