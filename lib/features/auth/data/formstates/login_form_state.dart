import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyanaseapp/features/invest/models/submission_response.dart';

part 'login_form_state.freezed.dart';
part 'login_form_state.g.dart';
// for json serialization

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    @Default('+256') String phoneNumber,
    @Default(null) String? phoneError,
    @Default('') String password,
    @Default(null) String? passwordError,
    @Default(false) bool isPasswordVisible,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(null) AsyncValue<SubmissionResponse?>? submission,
  }) = _LoginFormState;

  factory LoginFormState.fromJson(Map<String, dynamic> json) =>
      _$LoginFormStateFromJson(json);

  // tojson not factory
}
