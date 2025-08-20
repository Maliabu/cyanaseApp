// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_form_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginFormStateImpl _$$LoginFormStateImplFromJson(Map<String, dynamic> json) =>
    _$LoginFormStateImpl(
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      isPasswordVisible: json['isPasswordVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$$LoginFormStateImplToJson(
  _$LoginFormStateImpl instance,
) => <String, dynamic>{
  'phoneNumber': instance.phoneNumber,
  'password': instance.password,
  'isPasswordVisible': instance.isPasswordVisible,
};
