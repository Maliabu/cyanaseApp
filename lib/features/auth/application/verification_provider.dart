import 'package:cyanaseapp/features/auth/data/verification_code.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final verificationProvider =
    StateNotifierProvider<VerificationNotifier, VerificationCode>(
      (ref) => VerificationNotifier(),
    );

class VerificationNotifier extends StateNotifier<VerificationCode> {
  // generic, should know type of state to store
  // if recipe: add 1 tsp of [ingredient]?????????
  // specify generic Type to stateNotifier
  // VerificationNotifier(super.state);
  VerificationNotifier() : super(VerificationCode.initial());

  void setCode(String code) => state = state.copyWith(verificationCode: code);
}
