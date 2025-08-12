import 'package:cyanaseapp/core/providers/api_provider.dart';
import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/invest/domain/invest_form_state.dart';
import 'package:cyanaseapp/features/invest/models/submission_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'invest_form_notifier.dart';

final investFormProvider =
    NotifierProvider<InvestFormNotifier, InvestFormState>(
      () => InvestFormNotifier(),
    );

final investFormViewModelProvider = StateNotifierProvider<
  MultiStepFormViewModel,
  AsyncValue<SubmissionResponse>
>((ref) {
  final api = ref.read(apiServiceProvider);
  return MultiStepFormViewModel(api);
});

class MultiStepFormViewModel
    extends StateNotifier<AsyncValue<SubmissionResponse>> {
  final ApiService _api;

  MultiStepFormViewModel(this._api) : super(const AsyncLoading());

  Future<void> relworx(InvestFormState formState) async {
    state = const AsyncLoading();
    try {
      final response = await _api.investRelworx(formState);

      // if (formState.hasAttachments) {
      //   await _api.uploadFiles(formState.attachments, response.id);
      // }
      if (kDebugMode) {
        print(response);
      }

      state = AsyncData(response);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> flutterwave(InvestFormState formState) async {
    state = const AsyncLoading();
    try {
      final response = await _api.investFlutterwave(formState);

      // if (formState.hasAttachments) {
      //   await _api.uploadFiles(formState.attachments, response.id);
      // }
      if (kDebugMode) {
        print(response);
      }

      state = AsyncData(response);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
