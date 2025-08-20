import 'package:cyanaseapp/features/auth/models/verify_email_response.dart';
import 'package:cyanaseapp/features/invest/models/submission_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_form_state.freezed.dart';
part 'forgot_password_form_state.g.dart';

@freezed
class ForgotPasswordFormState with _$ForgotPasswordFormState{
  const factory ForgotPasswordFormState({
    required int step,
  required String email,
   String? emailError,
  required String password,
  required bool isPasswordVisible,
        @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<VerifyEmailResponse?>? emailVerify,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<SubmissionResponse?>? submission,
  required String confirmPassword}) = _ForgotPasswordFormState;

  factory ForgotPasswordFormState.initial() => ForgotPasswordFormState(email: '', emailError: null, password: '', confirmPassword: '', step: 1, isPasswordVisible: false,    submission: AsyncData(null), emailVerify: AsyncData(null)
);

  factory ForgotPasswordFormState.fromJson(Map<String, dynamic> json) => _$ForgotPasswordFormStateFromJson(json);
}

