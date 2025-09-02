// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_form_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgotPasswordFormStateImpl _$$ForgotPasswordFormStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ForgotPasswordFormStateImpl(
      step: (json['step'] as num).toInt(),
      email: json['email'] as String,
      emailError: json['emailError'] as String?,
      ref: json['ref'] as String?,
      password: json['password'] as String,
      isPasswordVisible: json['isPasswordVisible'] as bool,
      isConfirmPasswordVisible: json['isConfirmPasswordVisible'] as bool,
      codeDigits: (json['codeDigits'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          ['', '', '', '', '', ''],
      verificationCode: json['verificationCode'] as String,
      codeError: json['codeError'] as String?,
      passwordError: json['passwordError'] as String?,
      confirmPasswordError: json['confirmPasswordError'] as String?,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$$ForgotPasswordFormStateImplToJson(
        _$ForgotPasswordFormStateImpl instance) =>
    <String, dynamic>{
      'step': instance.step,
      'email': instance.email,
      'emailError': instance.emailError,
      'ref': instance.ref,
      'password': instance.password,
      'isPasswordVisible': instance.isPasswordVisible,
      'isConfirmPasswordVisible': instance.isConfirmPasswordVisible,
      'codeDigits': instance.codeDigits,
      'verificationCode': instance.verificationCode,
      'codeError': instance.codeError,
      'passwordError': instance.passwordError,
      'confirmPasswordError': instance.confirmPasswordError,
      'confirmPassword': instance.confirmPassword,
    };
