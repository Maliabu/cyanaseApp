// signup_form_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_form_state.freezed.dart';

@freezed
class SignupFormState with _$SignupFormState {
  const factory SignupFormState({
    @Default(0) int currentStep,
    @Default(false) bool isLoading,
    @Default(false) bool isCheckingUser,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String phoneNumber,
    @Default('') String countryName,
    @Default('') String countryCode,
    @Default('') String email,
    @Default('') String year,
    @Default('') String month,
    @Default('') String day,
    DateTime? birthDate,
    @Default('M') String gender,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool isConfirmPasswordVisible,

    @Default({}) Map<String, String> errorMessages,
  }) = _SignupFormState;
}
