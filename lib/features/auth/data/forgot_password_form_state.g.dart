// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_form_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgotPasswordFormStateImpl _$$ForgotPasswordFormStateImplFromJson(
  Map<String, dynamic> json,
) => _$ForgotPasswordFormStateImpl(
  step: (json['step'] as num).toInt(),
  email: json['email'] as String,
  emailError: json['emailError'] as String?,
  password: json['password'] as String,
  isPasswordVisible: json['isPasswordVisible'] as bool,
  confirmPassword: json['confirmPassword'] as String,
);

Map<String, dynamic> _$$ForgotPasswordFormStateImplToJson(
  _$ForgotPasswordFormStateImpl instance,
) => <String, dynamic>{
  'step': instance.step,
  'email': instance.email,
  'emailError': instance.emailError,
  'password': instance.password,
  'isPasswordVisible': instance.isPasswordVisible,
  'confirmPassword': instance.confirmPassword,
};
