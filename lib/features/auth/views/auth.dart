import 'package:cyanaseapp/features/auth/application/auth_mode_provider.dart';
import 'package:cyanaseapp/features/auth/views/login_with_phone.dart';
import 'package:cyanaseapp/features/auth/views/login_with_passcode.dart';
import 'package:cyanaseapp/features/auth/views/sign_up.dart';
import 'package:cyanaseapp/features/invest/models/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Auth extends ConsumerWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(authModeProvider);

    switch (mode) {
      case AuthMode.loginPhone:
        return Login();
      case AuthMode.signup:
        return SignUp();
      case AuthMode.loginPasscode:
        return PasscodeLoginScreen();
    }
  }
}
