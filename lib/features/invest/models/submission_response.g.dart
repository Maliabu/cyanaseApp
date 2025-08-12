// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmissionResponseImpl _$$SubmissionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SubmissionResponseImpl(
  id: json['id'] as String,
  status: json['status'] as String,
  message: json['message'] as String?,
);

Map<String, dynamic> _$$SubmissionResponseImplToJson(
  _$SubmissionResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'message': instance.message,
};
