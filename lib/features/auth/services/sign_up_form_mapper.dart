import 'package:cyanaseapp/features/auth/data/formstates/sign_up_form_state.dart';
import 'package:cyanaseapp/features/auth/models/profile.dart';
import 'package:cyanaseapp/features/auth/models/sign_up_request.dart';

// build the fields for submission in camelCase
// caling tojson creates the snake_case

extension SignupFormStateMapper on SignupFormState {
  SignupRequest toSignupRequest() {
    return SignupRequest(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      firstName: firstName,
      lastName: lastName,
      profile: Profile(
        birthDate: birthDate != null
            ? birthDate!.toIso8601String().split('T').first
            : '', // Format as yyyy-MM-dd
        gender: gender,
        phoneNumber: phoneNumber,
        country: countryCode,
      ),
    );
  }
}
