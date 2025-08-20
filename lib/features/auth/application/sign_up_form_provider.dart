import 'package:country_picker/country_picker.dart';
import 'package:cyanaseapp/features/auth/data/sign_up_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupFormProvider =
    NotifierProvider<SignupFormNotifier, SignupFormState>(
      SignupFormNotifier.new,
    );

class SignupFormNotifier extends Notifier<SignupFormState> {
  @override
  SignupFormState build() => const SignupFormState();

  void updateField(String field, String value) {
    state = state.copyWith();
  }

  void updateStep(int step) {
    state = state.copyWith(currentStep: step);
  }

  void setEmail(String email) => state = state.copyWith(email: email);

  void nextStep() {
    if (state.currentStep < 3) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void setCheckingUser(bool value) {
    state = state.copyWith(isCheckingUser: value);
  }

  void setFirstName(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void setLastName(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void setGender(String gender) {
    state = state.copyWith(gender: gender);
  }

  void setPhoneNumber(String value) =>
      state = state.copyWith(phoneNumber: value);

  void setCountry(Country country) {
    state = state.copyWith(
      countryCode: '+${country.phoneCode}',
      countryName: country.name,
    );
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(
      isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
    );
  }

  void setBirthDate(DateTime date) {
    state = state.copyWith(birthDate: date);
  }

  void setPassword(String value) {
    state = state.copyWith(password: value);
  }

  void setConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value);
  }

  void setError(String field, String message) {
    final updatedErrors = Map<String, String>.from(state.errorMessages);
    updatedErrors[field] = message;
    state = state.copyWith(errorMessages: updatedErrors);
  }

  void clearErrors() {
    state = state.copyWith(errorMessages: {});
  }
}