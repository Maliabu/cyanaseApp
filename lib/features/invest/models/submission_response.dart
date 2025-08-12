import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission_response.freezed.dart';
part 'submission_response.g.dart';

@freezed
class SubmissionResponse with _$SubmissionResponse {
  const factory SubmissionResponse({
    required String id,
    required String status,
    String? message,
  }) = _SubmissionResponse;

  factory SubmissionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmissionResponseFromJson(json);
}
