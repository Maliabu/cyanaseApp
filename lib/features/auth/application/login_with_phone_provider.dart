// lib/features/auth/application/login_form_provider.dart

import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/application/isar_provider.dart';
import 'package:cyanaseapp/features/auth/data/formstates/login_form_state.dart';
import 'package:cyanaseapp/features/auth/models/verify_email_response.dart';
import 'package:cyanaseapp/features/auth/services/encryption_helper.dart';
import 'package:cyanaseapp/features/auth/services/secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginFormProvider =
    NotifierProvider<LoginFormNotifier, LoginFormState>(
      LoginFormNotifier.new
    );

class LoginFormNotifier extends Notifier<LoginFormState> {
  
  @override
  LoginFormState build() => const LoginFormState();

  bool get isPasswordEmpty => state.phoneNumber.isEmpty;
  bool get isPhoneEmpty => state.phoneNumber.isEmpty;

  void setPhone(String phone) {
    // Basic checks
    if (phone.isEmpty) {
      state = state.copyWith(phoneNumber: phone, phoneError: 'Phone number is required');
      return;
    }

    if (phone.length != 13) {
      state = state.copyWith(phoneNumber: phone, phoneError: 'Invalid phone number');
      return;
    }

    // If valid
    state = state.copyWith(phoneNumber: phone, phoneError: null);
  }


  void setPassword(String password) {
    if (password.isEmpty) {
      state = state.copyWith(password: password, passwordError: 'Password is required');
      return;
    }

    final isValid = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{6,}$')
        .hasMatch(password);
    if (!isValid) {
      state = state.copyWith(password: password, passwordError: 'Invalid Password');
      return;
    }

    // If valid
    state = state.copyWith(password: password, passwordError: null);
  }


  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  Future<VerifyEmailResponse> validatePhonePassword() async {
    // validate and call login
    // no empty fields or errors
    if(state.passwordError == null && state.phoneError == null){
      // login api
      final api = ApiService();
      final login = await loginWithPhone(api, state.phoneNumber, state.password);
      return login;

    }
    return VerifyEmailResponse(success: false, message: 'Invalid Credentials: incomplete request');

  }

  // api guys
  Future<VerifyEmailResponse> loginWithPhone(ApiService api, String phone, String password) async {
    final isarService = await ref.read(isarProvider.future);
  try {

    final response = await api.loginWithPasscode(phone, password);

    //  Check if login successful
    if (response.success) {
      // Save updated user info to Isar cache (if response includes user data)
      await isarService.cacheUser(response.user!);

      // secure token and id
      // encrypt
      final encryptedToken = EncryptionHelper.encryptText(response.user!.token);
      await ref.read(secureStorageProvider).saveToken(response.user!.token);
      await ref.read(secureStorageProvider).saveUserId(response.user!.userId.toString());

      // we are certain to login to homepage
      state = state.copyWith(submission: AsyncData(null));
      return VerifyEmailResponse(success: true, message: response.message);
    } else {
      // Handle unsuccessful login
      state = state.copyWith(submission: AsyncData(null));
      return VerifyEmailResponse(success: false, message: response.message);
    }
  } catch (e) {
    print(e);
    state = state.copyWith(submission: AsyncData(null));
    return VerifyEmailResponse(success: false, message: 'Server Error');
  }
}
}
