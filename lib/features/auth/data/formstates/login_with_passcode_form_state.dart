// we r just going to stick
// with notifier patterns
// because its more control for less code
// even for primitive states
// compared to stateNotifier

import 'package:cyanaseapp/features/auth/models/sign_up_response.dart';
import 'package:cyanaseapp/features/invest/models/submission_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_with_passcode_form_state.freezed.dart';
part 'login_with_passcode_form_state.g.dart';

// lets freeze for 1 state
@freezed
class LoginWithPasscodeFormState with _$LoginWithPasscodeFormState{
  // factory constructor with _$ to tell flutter its generated code
  const factory LoginWithPasscodeFormState({
    // we are submitting a passcode so
    // only serializable we need to send to django
    @Default('') String passcode,
    // django will probably return sth so
    // we probably need a login response model
    // unless we have a reusable one like the signup response
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(AsyncData(null)) AsyncValue<SignUpResponse?> loginResponse,
    // during submission
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(AsyncData(null)) AsyncValue<SubmissionResponse?> submission
  }) = _LoginWithPasscodeFormState;

  // dont forget to serialise
  // we shall submit passcode to django so
  // our 'parts - g.dart and freezed.dart'

  //tojson is bydefault generated
  // so lets implement fromjson method

  factory LoginWithPasscodeFormState.fromJson(Map<String, dynamic> json) => _$LoginWithPasscodeFormStateFromJson(json);
}