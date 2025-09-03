import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/application/isar_provider.dart';
import 'package:cyanaseapp/features/auth/data/formstates/login_with_passcode_form_state.dart';
import 'package:cyanaseapp/features/auth/models/verify_email_response.dart';
import 'package:cyanaseapp/features/auth/services/secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// NotifierProvider
final passcodeProvider = NotifierProvider<PasscodeNotifier,LoginWithPasscodeFormState>(
  // init
  PasscodeNotifier.new
);

// notifier - Riverpod 2, modern, handles async values best
class PasscodeNotifier extends Notifier<LoginWithPasscodeFormState>{
  // build formstate
  @override
  LoginWithPasscodeFormState build() => const LoginWithPasscodeFormState();

  // getters and setters
  
  bool get isFull => state.passcode.length == 4;
  bool get isEmpty => state.passcode.isEmpty;

  void addDigit(String digit) async {
    final newPasscode = state.passcode + digit;

    if (newPasscode.length < 4) {
      state = state.copyWith(passcode: newPasscode);
      return;
    }
    if(newPasscode.length == 4)
    {
      // Passcode is now 4 digits
      state = state.copyWith(passcode: newPasscode, submission: AsyncLoading());

      final api = ApiService();
      final success = await validatePasscode(api);

      if (!success.success) {
        state = state.copyWith(
          submission: AsyncError({'error': success.message}, StackTrace.current),
        );
      } else {
        state = state.copyWith(submission: AsyncData(null));
      }
    }
  }


  void deleteDigit() {
    if (!isEmpty) {
      state = state.copyWith(
        passcode: state.passcode.substring(0, state.passcode.length - 1),
      );
    }
  }

  //validate and submit
  Future<VerifyEmailResponse> validatePasscode (ApiService api) async {
    // just check that passcode has 4 digits and submit
    if(isFull){
      // call api guys
      // integer passcode
      int passcode = int.parse(state.passcode);
      final response = await loginWithPasscode(api, passcode);
      return response;
    } else {
      return VerifyEmailResponse(success: false, message: '4 digit Passcode is needed');
    }
  }

  // api guys
  Future<VerifyEmailResponse> loginWithPasscode(ApiService api, int passcode) async {
    final isarService = await ref.read(isarProvider.future);
  try {
    // Step 1: Get cached user
    final cachedUser = await isarService.getCachedUser();

    if (cachedUser == null) {
      // stop submission
      // user has never logged in once
      // let them use phone number
      state = state.copyWith(submission: AsyncData(null));
      return VerifyEmailResponse(success: false, message: 'Hello User, Login with Phone Number to set a passcode');
    }

    // Step 2: Use cached user info + passcode to login via API
    // For example, if your API expects just passcode:
    // get token from cache
    String email = cachedUser.email;
    final response = await api.loginWithPasscode(passcode.toString(), email);

    // or if it requires userId/email + passcode:
    // final response = await api.loginWithPasscodeWithUser(cachedUser.email, passcode);

    // Step 3: Check if login successful (depends on your API response)
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

