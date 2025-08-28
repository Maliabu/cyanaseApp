
import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/data/forgot_password_form_state.dart';
import 'package:cyanaseapp/features/auth/models/verify_email_response.dart';
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
  final isValid = RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}")
        .hasMatch(email);

  if (email.isEmpty) {
    error = 'Email cannot be empty';
  } else if (!isValid) {
    error = 'Enter a valid email';
  }

  state = state.copyWith(
    email: email,
    emailError: error,
  );
  // no async inside void
  }

  Future<VerifyEmailResponse> validateAndProceedEmail(ApiService api) async {
  String? error;

  if (state.email.isEmpty) {
    error = 'Email cannot be empty';
  } else if (!state.email.contains('@') || !state.email.contains('.')) {
    error = 'Enter a valid email';
  }

  if (error != null) {
    state = state.copyWith(emailError: error);
    return VerifyEmailResponse(success: false, message: error);
  } else {
    state = state.copyWith(emailError: null);
      final response = await verifyEmail(api, state.email); // return result
      return response;
  }
}

Future<VerifyEmailResponse> validateAndProceedEmailCode(ApiService api, String code) async {
  String? error;

  if (state.codeDigits.isEmpty) {
    error = 'Code cannot be empty';
  } else if (state.codeDigits.length < 6) {
    error = 'Enter a 6 - digit code';
  }

  if (error != null) {
    state = state.copyWith(codeError: error);
    return VerifyEmailResponse(success: false, message: 'Error occured');
  } else {
    state = state.copyWith(codeError: null);
      final response = await verifyEmailCode(api, state.email, code); // return result
      return response;
  }
}


  void setPassword(String password) {
    final isValid = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{6,}$')
        .hasMatch(password);
    // if password is not empty and isvalid?
    // meaning no error
    if(password.isEmpty){
      state = state.copyWith(passwordError: 'Enter a password');
    }
    if(!isValid){
      state = state.copyWith(passwordError: 'Password should be atleast 6 char long with a lowercase, uppercase, digit and a symbol');
    }
    else{state = state.copyWith(
      password: password,
      passwordError: null
    );}
  }

  void setConfirmPassword(String confirmPassword) {
    if(confirmPassword.isEmpty){
      state = state.copyWith(confirmPasswordError: 'confirm your password');
    }
    if(state.password != confirmPassword){
      state = state.copyWith(confirmPasswordError: 'Passwords dont match');
    }
    else{state = state.copyWith(
      confirmPassword: confirmPassword,
      confirmPasswordError: null
    );}
  }

  void setVerificationCode(int index, String value) {
    final updated = [...state.codeDigits];
    updated[index] = value;
    state = state.copyWith(codeDigits: updated);

    if (updated.every((d) => d.isNotEmpty)) {
      final fullCode = updated.join();
      state = state.copyWith(verificationCode: fullCode);
    }
  }

  void togglePasswordVisibility() {
      state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
    }
    void setLoading(bool loading) {
    state = state.copyWith(submission: loading ? const AsyncValue.loading() : const AsyncValue.data(null));
  }
  void toggleConfirmPasswordVisibility() {
      state = state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible);
    }
  Future<VerifyEmailResponse> submit(ApiService api) async {
    if(state.passwordError == null && state.confirmPasswordError == null && state.ref != null){
      final submission = await submitForm(api, state.password, state.email, state.ref!);
      return submission;
    } return VerifyEmailResponse(success: false, message: 'Enter a password');
  }

  Future<VerifyEmailResponse> verifyEmail(ApiService api, String email) async {
  state = state.copyWith(submission: const AsyncLoading());

  try {
    // send email to backend, it will generate code and send email with code
    final response = await api.verifyEmail(email); // this returns bool

    if (response.success) {
      // Email is valid
      state = state.copyWith(
        emailError: null,
        emailVerify: AsyncData(response),
        submission: AsyncData(null)
      );
      if(state.step == 1){
        nextStep();
      }
      //reset digits because step is probably 2 and you dont need to go to 3 
      // coz user probably requested code after prev expired
      return response;
    } else {
      // Email is not valid
      state = state.copyWith(
        emailError: 'Account doesnot exist',
        emailVerify: AsyncData(response),
        submission: AsyncData(null)
      );

      return response;
    }
  } catch (e, st) {
    if (kDebugMode) {
      print('STACK TRACE: $st');
    }
    final responseError = VerifyEmailResponse(success: false, message: 'Network or server Error');

    state = state.copyWith(
      emailError: 'Network or server error',
      emailVerify: AsyncData(responseError),
      submission: AsyncData(null)
    );

    return responseError;
  }
}

Future<VerifyEmailResponse> verifyEmailCode(ApiService api, String email, String verificationCode) async {
  state = state.copyWith(submission: const AsyncLoading());

  try {
    // send email to backend, it will generate code and send email with code
    final response = await api.verifyEmailCode(email, verificationCode); // this returns bool

    if (response.success) {
      // Email is valid
      state = state.copyWith(
        emailError: null,
        emailVerify: AsyncData(response),
        submission: AsyncData(null),
        ref: response.ref
      );
      nextStep();
      return response;
    } else {
      // Email is not valid
      state = state.copyWith(
        emailError: 'Account doesnot exist',
        emailVerify: AsyncData(response),
        submission: AsyncData(null)
      );

      return response;
    }
  } catch (e, st) {
    if (kDebugMode) {
      print('STACK TRACE: $st');
    }
    final responseError = VerifyEmailResponse(success: false, message: 'Network or server Error');

    state = state.copyWith(
      emailError: 'Network or server error',
      emailVerify: AsyncData(responseError)
    );

    return responseError;
  }
}

  Future<VerifyEmailResponse> submitForm(ApiService api, String password, String email, String ref) async {
    state = state.copyWith(submission: const AsyncLoading());
    try {
    // send password + email
    final response = await api.resetPassword(password, email, ref);

    if (response.success) {
      state = state.copyWith(
        passwordError: null,
        confirmPasswordError: null,
        submission: AsyncData(null)
      );

      return response;
    } else {
      state = state.copyWith(
        passwordError: null,
        confirmPasswordError: null,
        submission: AsyncData(null)
      );

      return response;
    }
  } catch (e, st) {
    if (kDebugMode) {
      print('STACK TRACE: $st');
    }
    final responseError = VerifyEmailResponse(success: false, message: 'Network or server Error');
    state = state.copyWith(
      passwordError: null,
        confirmPasswordError: null,
      submission: AsyncData(null)
    );

    return responseError;
  }
  }

  void resetForm() {
    state = ForgotPasswordFormState.initial();
  }
}
