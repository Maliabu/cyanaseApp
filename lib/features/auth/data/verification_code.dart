// verification_code.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyanaseapp/features/invest/models/submission_response.dart';

part 'verification_code.freezed.dart';

@freezed
class VerificationCode with _$VerificationCode {
  const factory VerificationCode({
    required String verificationCode,
    @Default(AsyncData<SubmissionResponse?>(null))
    AsyncValue<SubmissionResponse?> submission,
  }) = _VerificationCode;

  factory VerificationCode.initial() =>
      const VerificationCode(verificationCode: '');
}
