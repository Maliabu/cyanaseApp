import 'package:cyanaseapp/core/providers/api_provider.dart';
import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/data/login_form_state.dart';
import 'package:cyanaseapp/features/invest/models/submission_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginFormProvider =
    StateNotifierProvider<LoginViewModel, AsyncValue<SubmissionResponse>>((
      ref,
    ) {
      final api = ref.read(apiServiceProvider);
      return LoginViewModel(api);
    });

class LoginViewModel extends StateNotifier<AsyncValue<SubmissionResponse>> {
  final ApiService _api;

  LoginViewModel(this._api) : super(const AsyncLoading());

  Future<void> login(String phoneNumber, String password) async {
    state = const AsyncLoading();

    //try, catch
    try {
      final response = await _api.login(
        LoginFormState(phoneNumber: phoneNumber, password: password),
      );
      state = AsyncData(response);
    } catch (e, st) {
      // error + stack trace
      state = AsyncError(e, st);
    }
  }
}
