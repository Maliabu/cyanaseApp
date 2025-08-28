// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyEmailResponseImpl _$$VerifyEmailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$VerifyEmailResponseImpl(
  success: json['success'] as bool,
  message: json['message'] as String?,
  ref: json['ref'] as String?,
);

Map<String, dynamic> _$$VerifyEmailResponseImplToJson(
  _$VerifyEmailResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'ref': instance.ref,
};
