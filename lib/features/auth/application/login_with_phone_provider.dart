// lib/features/auth/application/login_form_provider.dart

import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/application/isar_provider.dart';
import 'package:cyanaseapp/features/auth/data/formstates/login_form_state.dart';
import 'package:cyanaseapp/features/auth/models/verify_email_response.dart';
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
    // valid and not empty check
    if(isPhoneEmpty){
      // throw phone errors yooo
      state = state.copyWith(phoneError: 'Phone number is required');
    }
    if(phone.length != 13){
      // throw phone errors yooo
      state = state.copyWith(phoneError: 'Invalid Phone number');
    }
    // else remove errors, update state
    final prefix = state.phoneNumber;
    state = state.copyWith(phoneNumber: prefix+phone, phoneError: null);
  }

  void setPassword(String password) {
    final isValid = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{6,}$')
        .hasMatch(password);
    if(isPasswordEmpty){
      state = state.copyWith(passwordError: 'Password is required');
    }
    if(!isValid){
      state = state.copyWith(passwordError: 'Invalid Password');
    }
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
  } catch (e, st) {
    print(e);
    state = state.copyWith(submission: AsyncData(null));
    return VerifyEmailResponse(success: false, message: 'Server Error');
  }
}
}
