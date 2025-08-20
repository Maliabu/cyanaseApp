import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/data/forgot_password_form_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forgotPasswordProvider =
    NotifierProvider<ForgotPasswordProvider, ForgotPasswordFormState>(
      () => ForgotPasswordProvider(),
    );

class ForgotPasswordProvider extends Notifier<ForgotPasswordFormState> {
  @override
  ForgotPasswordFormState build() => ForgotPasswordFormState.initial();

  void nextStep() => state = state.copyWith(step: state.step + 1);
  void previousStep() => state = state.copyWith(step: state.step - 1);

  void setEmail(String email) {
  String? error;

  if (email.isEmpty) {
    error = 'Email cannot be empty';
  } else if (!email.contains('@')) {
    error = 'Enter a valid email';
  }

  state = state.copyWith(
    email: email,
    emailError: error,
  );
  // no async inside void
  }


  Future<bool> validateAndProceedEmail(ApiService api) async {
  String? error;

  if (kDebugMode) {
    print(state.email);
  }

  if (state.email.isEmpty) {
    error = 'Email cannot be empty';
  } else if (!state.email.contains('@') || !state.email.contains('.')) {
    error = 'Enter a valid email';
  }

  if (error != null) {
    state = state.copyWith(emailError: error);
    return false; // return false on validation error
  } else {
    state = state.copyWith(emailError: null);
    final response = await verifyEmail(api, state.email); // return result
    print(response);
    return response;
  }
}



  void setPassword(String password) {
    state = state.copyWith(
      password: password,
      step: state.step + 1,
    );
  }

  void setConfirmPassword(String confirmPassword) {
    state = state.copyWith(
      confirmPassword: confirmPassword,
      step: state.step + 1,
    );
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  Future<bool> verifyEmail(ApiService api, String email) async {
  state = state.copyWith(submission: const AsyncLoading());

  try {
    final response = await api.verifyEmail(email);

    if (response.success) {
      //  Backend confirms email is valid
      state = state.copyWith(
        emailVerify: AsyncData(response),
        emailError: null,
      );

      nextStep(); //  Step only advances here

      return true;
    } else {
      //  Backend responded with success: false
      state = state.copyWith(
        emailVerify: AsyncData(response),
        emailError: response.message ?? 'Email verification failed',
      );

      return false;
    }
  } catch (e, st) {
    if (kDebugMode) {
      print(st);
    }
    //  Exception, e.g. 404 or network error
    state = state.copyWith(
      submission: AsyncError(e, st),
      emailError: 'Network or server error',
    );

    return false;
  }
}

  Future<void> submitForm(ApiService api) async {
    state = state.copyWith(submission: const AsyncLoading());
  }

  void resetForm() {
    state = ForgotPasswordFormState.initial();
  }
}
