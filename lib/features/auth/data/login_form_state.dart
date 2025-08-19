import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyanaseapp/features/invest/models/submission_response.dart';

part 'login_form_state.freezed.dart';
part 'login_form_state.g.dart';
// for json serialization

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    required String phoneNumber,
    required String password,
    @JsonKey(includeFromJson: false, includeToJson: false)
    AsyncValue<SubmissionResponse?>? submission,
  }) = _LoginFormState;

  // 👇 Custom constructor (like initial state)
  // factory constructors return instances of classes/instance/subtype
  factory LoginFormState.initial() => const LoginFormState(
    phoneNumber: '',
    password: '',
    submission: AsyncData(null),
  );
  factory LoginFormState.fromJson(Map<String, dynamic> json) =>
      _$LoginFormStateFromJson(json);

  // tojson not factory
}
