import 'package:country_picker/country_picker.dart';
import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/data/sign_up_form_state.dart';
import 'package:cyanaseapp/features/auth/models/sign_up_response.dart';
import 'package:cyanaseapp/features/auth/models/verify_email_response.dart';
import 'package:cyanaseapp/features/auth/services/sign_up_form_mapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupFormProvider =
    NotifierProvider<SignupFormNotifier, SignupFormState>(
      SignupFormNotifier.new,
    );

class SignupFormNotifier extends Notifier<SignupFormState> {
  @override
  SignupFormState build() => const SignupFormState();

  void setEmail(String email) {
  String? error;
  final isValid = RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}")
        .hasMatch(email);

  if (email.isEmpty) {
    error = 'Email cannot be empty';
  } else if (!isValid) {
    error = 'Enter a valid email';
  }

  state = state.copyWith(
    email: email,
    emailError: error,
  );
  // no async inside void
  }

  void nextStep() {
    if (state.step < 7) {
      state = state.copyWith(step: state.step + 1);
    }
  }

  void previousStep() {
    if (state.step > 0) {
      state = state.copyWith(step: state.step - 1);
    }
  }

  void setFirstName(String firstName) {
    // check errors like empty fields

    if(firstName == ''){
      // without assigning, state is created and dumped unused
      state = state.copyWith(firstNameError: 'first name is required');
    } else{
    state = state.copyWith(firstName: firstName,firstNameError: null);}
  }

  void setLastName(String lastName) {
    // check errors like empty fields
    if(lastName == ''){
      state = state.copyWith(lastNameError: 'last name is required');
    } else{
    state = state.copyWith(lastName: lastName,lastNameError: null);}
  }

  void setGender(String gender) {
    if(gender == ''){
      state = state.copyWith(genderError: 'select your gender');
    } else{
    state = state.copyWith(gender: gender,genderError: null);}
  }

  void setPhoneNumber(String phoneNumber){
    final fullNumber = state.countryCode+phoneNumber;
    if(fullNumber == '' || fullNumber.length < 13){
      // empty phone number 
      // or missing area code +256
      state = state.copyWith(phoneError: 'phone number is required as of: +(areacode)');
    } else{
    state = state.copyWith(phoneNumber: fullNumber,phoneError: null);}}

  void setCountry(Country country) {
    if(country.countryCode == '' && country.name == ''){
      state = state.copyWith(countryError: 'country is required');
    } else{
    state = state.copyWith(
      countryCode: '+${country.phoneCode}',
      countryName: country.name,
      countryFlag: country.flagEmoji,
      countryError: null
    );}
    
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(
      isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
    );
  }

  void setBirthDate(DateTime date) {
    bool isDobBelievable(DateTime dob) {
      final now = DateTime.now();
      final age = now.year - dob.year;
      if (dob.isAfter(now)) return false; // can't be born in the future
      return age >= 13 && age <= 120;
    }

    if(!isDobBelievable(date)){
      state = state.copyWith(birthDateError: 'invalid date of birth');
    }
    else{
      state = state.copyWith(birthDate: date, birthDateError: null);
    }
  }

    void setPassword(String password) {
    final isValid = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{6,}$')
        .hasMatch(password);
    // if password is not empty and isvalid?
    // meaning no error
    if(password.isEmpty){
      state = state.copyWith(passwordError: 'Enter a password');
    }
    if(!isValid){
      state = state.copyWith(passwordError: 'Password should be atleast 6 char long with a lowercase, uppercase, digit and a symbol');
    }
    else{state = state.copyWith(
      password: password,
      passwordError: null
    );}
  }

  void setConfirmPassword(String confirmPassword) {
    if(confirmPassword.isEmpty){
      state = state.copyWith(confirmPasswordError: 'confirm your password');
    }
    if(state.password != confirmPassword){
      state = state.copyWith(confirmPasswordError: 'Passwords dont match');
    }
    else{state = state.copyWith(
      confirmPassword: confirmPassword,
      confirmPasswordError: null
    );}
  }
  /////////////////////////////////////////////
  /// maybe middlemen
  Future<VerifyEmailResponse> validateUserEmailPhone(ApiService api) async {
      // call our api guy
      final response = await validateEmailPhone(api);
      // we r using alot of verifyemailresponse because we want the error to move
      // up to the ui from server
      if(response.success == true && response.type == 'server'){
        // ui now calls middleman for this response
        return VerifyEmailResponse(success: true, message: 'Server Error, please try again.');
      }
      if(response.success == true && response.type == null){
        // ui now calls middleman for this response
        return VerifyEmailResponse(success: true, message: response.message);
      }
      else {
        return VerifyEmailResponse(success: false);
      }

  }

  Future<SignUpResponse> submit(ApiService api) async {
    if(state.passwordError == null && state.confirmPasswordError == null){
      final submission = await submitForm(api  );
      return submission;
    } return SignUpResponse(success: false, message: 'Enter a password');
  }

  ////////////////////////////////////////////// 
  // api service providers - just send, no more checks
  // validate user email 
  Future<VerifyEmailResponse> validateEmailPhone(ApiService api) async {
    // lets load
    state = state.copyWith(submission: AsyncValue.loading());
    // ui will now show spinner
    
    //try-catch
    try{
      // return everywhere dude
      final response = await api.validateSignUpEmailPhone(state.email, state.phoneNumber);

      if(response.success){
        // true
        // yeap we in business with this account so cant signup
        state = state.copyWith(
          emailError: null, 
          submission: AsyncData(null), 
          response: AsyncData(VerifyEmailResponse(success: false, message: response.message!)));

        //we can move to next
        // but let ui do that
        return response;
      } else {
        // false - new user
        state = state.copyWith(
          emailError: null, 
          submission: AsyncData(null), 
          response: AsyncData(null));
        return response;
      }

    } catch(e, st){
      print('still getting some error $e');
      // catch error and stack trace in dev console
      // usually network or some shitty error from server

      // throw error, stop loading
      state = state.copyWith(
        emailError: null, 
        submission: AsyncData(null), 
        response: AsyncData(VerifyEmailResponse(success: true, message: 'Network Error', type: 'server')));

      // you might want to check that stack trace bro so log it
      // ignore Kdebug, mostly harmless - i always assume
      // respect return type, dart aint subtle
      return VerifyEmailResponse(success: true, message: 'Network Error', type: 'server');
    }

  }
  Future<SignUpResponse> submitForm(ApiService api) async {
    state = state.copyWith(submission: const AsyncLoading());
    try {
    // send password + email
    final request = state.toSignupRequest();
    final response = await api.signUp(request);

    if (response.success) {
      state = state.copyWith(
        passwordError: null,
        confirmPasswordError: null,
        submission: AsyncData(null)
      );

      return response;
    } else {
      state = state.copyWith(
        passwordError: null,
        confirmPasswordError: null,
        submission: AsyncData(null)
      );

      return response;
    }
  } catch (e, st) {
       print('STACK TRACE: $e');
    final responseError = SignUpResponse(success: false, message: 'Network or server Error');
    state = state.copyWith(
      passwordError: null,
        confirmPasswordError: null,
      submission: AsyncData(null)
    );

    return responseError;
  }
  }


}