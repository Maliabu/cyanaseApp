// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_form_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginFormStateImpl _$$LoginFormStateImplFromJson(Map<String, dynamic> json) =>
    _$LoginFormStateImpl(
      phoneNumber: json['phoneNumber'] as String? ?? '+256',
      phoneError: json['phoneError'] as String? ?? null,
      password: json['password'] as String? ?? '',
      passwordError: json['passwordError'] as String? ?? null,
      isPasswordVisible: json['isPasswordVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$$LoginFormStateImplToJson(
        _$LoginFormStateImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'phoneError': instance.phoneError,
      'password': instance.password,
      'passwordError': instance.passwordError,
      'isPasswordVisible': instance.isPasswordVisible,
    };
