// lib/features/auth/application/login_form_provider.dart

import 'package:cyanaseapp/features/auth/data/login_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginFormProvider =
    StateNotifierProvider<LoginFormNotifier, LoginFormState>(
      (ref) => LoginFormNotifier(),
    );

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier() : super(LoginFormState.initial());

  void updatePhone(String value) {
    state = state.copyWith(phoneNumber: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  Future<void> submit() async {
    state = state.copyWith(submission: const AsyncLoading());

    try {
      final response = await Future.delayed(
        const Duration(seconds: 2),
      ); // simulate API

      if (state.phoneNumber != '0700000000' || state.password != '1234') {
        throw Exception("Invalid credentials");
      }

      state = state.copyWith(submission: AsyncData(response));
      // Success: Navigate or show success
    } catch (e, st) {
      state = state.copyWith(submission: AsyncError(e, st));
    }
  }
}
