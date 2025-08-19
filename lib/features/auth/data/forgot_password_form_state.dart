part 'forgot_password_form_state.freezed.dart';
part 'forgor_password_form_state.g.dart';

@freezed
class ForgotPasswordFormState with _$ForgotPasswordFormState{
  const factory ForgotPasswordFormState({
  String email,
  String password,
  String confirmPassword})
} = _ForgotPasswordFormState;