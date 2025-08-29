// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpResponseImpl _$$SignUpResponseImplFromJson(Map<String, dynamic> json) =>
    _$SignUpResponseImpl(
      message: json['message'] as String,
      success: json['success'] as bool,
      verificationcode: json['verificationcode'] as String?,
      user:
          json['user'] == null
              ? null
              : User.fromJson(json['user'] as Map<String, dynamic>),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$SignUpResponseImplToJson(
  _$SignUpResponseImpl instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
  'verificationcode': instance.verificationcode,
  'user': instance.user,
  'type': instance.type,
};
