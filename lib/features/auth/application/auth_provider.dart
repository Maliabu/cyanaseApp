import 'package:cyanaseapp/features/invest/models/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authModeProvider = NotifierProvider<AuthModeNotifier, AuthMode>(
  AuthModeNotifier.new,
);

class AuthModeNotifier extends Notifier<AuthMode> {
  @override
  AuthMode build() {
    // This is the default mode on load
    return AuthMode.loginPhone;
  }

  void setMode(AuthMode mode) => state = mode;
}