class LoginFormState {
  // define vars for immutable class
  final String phoneNumber;
  final String password;

  // initialize
  LoginFormState({required this.phoneNumber, required this.password});

  //copy or clone this with new input for api
  LoginFormState copyWith({String? phoneNumber, String? password}) {
    return LoginFormState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }

  // serialise to send as json data to api
  Map<String, dynamic> toJson() {
    return {'phone_no': phoneNumber, 'password': password};
  }
}
