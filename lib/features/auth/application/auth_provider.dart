import 'package:cyanaseapp/features/auth/application/auth_notifier.dart';
import 'package:cyanaseapp/features/invest/models/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authModeProvider = NotifierProvider<AuthModeNotifier, AuthMode>(
  AuthModeNotifier.new,
);
