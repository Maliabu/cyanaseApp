// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_form_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignupFormStateImpl _$$SignupFormStateImplFromJson(
        Map<String, dynamic> json) =>
    _$SignupFormStateImpl(
      step: (json['step'] as num?)?.toInt() ?? 1,
      firstName: json['firstName'] as String? ?? '',
      firstNameError: json['firstNameError'] as String? ?? null,
      lastName: json['lastName'] as String? ?? '',
      lastNameError: json['lastNameError'] as String? ?? null,
      phoneNumber: json['phoneNumber'] as String? ?? '',
      phoneError: json['phoneError'] as String? ?? null,
      countryName: json['countryName'] as String? ?? 'Uganda',
      countryCode: json['countryCode'] as String? ?? '+256',
      countryFlag: json['countryFlag'] as String? ?? '🇺🇬',
      countryError: json['countryError'] as String? ?? null,
      email: json['email'] as String? ?? '',
      emailError: json['emailError'] as String? ?? null,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      birthDateError: json['birthDateError'] as String? ?? null,
      gender: json['gender'] as String? ?? 'M',
      genderError: json['genderError'] as String? ?? null,
      password: json['password'] as String? ?? '',
      passwordError: json['passwordError'] as String? ?? null,
      confirmPassword: json['confirmPassword'] as String? ?? '',
      confirmPasswordError: json['confirmPasswordError'] as String? ?? null,
      isPasswordVisible: json['isPasswordVisible'] as bool? ?? false,
      isConfirmPasswordVisible:
          json['isConfirmPasswordVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$$SignupFormStateImplToJson(
        _$SignupFormStateImpl instance) =>
    <String, dynamic>{
      'step': instance.step,
      'firstName': instance.firstName,
      'firstNameError': instance.firstNameError,
      'lastName': instance.lastName,
      'lastNameError': instance.lastNameError,
      'phoneNumber': instance.phoneNumber,
      'phoneError': instance.phoneError,
      'countryName': instance.countryName,
      'countryCode': instance.countryCode,
      'countryFlag': instance.countryFlag,
      'countryError': instance.countryError,
      'email': instance.email,
      'emailError': instance.emailError,
      'birthDate': instance.birthDate?.toIso8601String(),
      'birthDateError': instance.birthDateError,
      'gender': instance.gender,
      'genderError': instance.genderError,
      'password': instance.password,
      'passwordError': instance.passwordError,
      'confirmPassword': instance.confirmPassword,
      'confirmPasswordError': instance.confirmPasswordError,
      'isPasswordVisible': instance.isPasswordVisible,
      'isConfirmPasswordVisible': instance.isConfirmPasswordVisible,
    };
