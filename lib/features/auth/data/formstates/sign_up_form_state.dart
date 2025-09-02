// signup_form_state.dart
import 'package:cyanaseapp/features/auth/models/verify_email_response.dart';
import 'package:cyanaseapp/features/invest/models/submission_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_form_state.freezed.dart';
part 'sign_up_form_state.g.dart';
// we need json serialisation for form submission and response
// so g.dart

// sometimes when you make changes n run build runner and nothing happens
// run flutter clean then pub get then build runner - deleting conflicts
// last option hot restart, kill terminal, restart

@freezed
class SignupFormState with _$SignupFormState {
  const factory SignupFormState({
    @Default(1) int step,
    @Default('') String firstName,
    @Default(null) String? firstNameError,
    @Default('') String lastName,
    @Default(null) String? lastNameError,
    @Default('') String phoneNumber,
    @Default(null) String? phoneError,
    @Default('Uganda') String countryName,
    @Default('+256') String countryCode,
    @Default('🇺🇬') String countryFlag,
    @Default(null) String? countryError,
    @Default('') String email,
    @Default(null) String? emailError,
    DateTime? birthDate,
    @Default(null) String? birthDateError,
    @Default('M') String gender,
    @Default(null) String? genderError,
    @Default('') String password,
    @Default(null) String? passwordError,
    @Default('') String confirmPassword,
    @Default(null) String? confirmPasswordError,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool isConfirmPasswordVisible,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(AsyncData(null)) AsyncValue<SubmissionResponse?>? submission,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(AsyncData(null)) AsyncValue<VerifyEmailResponse?>? response
  }) = _SignupFormState;

  // submission for Async values(loading, error)
  // and response for api response handling
  // excluded from json because we only need them as runtime vars.
  // also we used @Default decorator so we dont write a .inital() to initialise
  // like step=1;

  // fromjson is auto enabled by freezed
  factory SignupFormState.fromJson(Map<String, dynamic> json) =>
      _$SignupFormStateFromJson(json);

  // enable first to be able to override here
  // @override
  // Map<String, dynamic> toJson() => _$SignupFormStateToJson(this);
}
