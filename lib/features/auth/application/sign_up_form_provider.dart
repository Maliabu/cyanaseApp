import 'package:cyanaseapp/features/auth/application/sign_up_form_notifier.dart';
import 'package:cyanaseapp/features/auth/data/sign_up_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupFormProvider =
    NotifierProvider<SignupFormNotifier, SignupFormState>(
      SignupFormNotifier.new,
    );
