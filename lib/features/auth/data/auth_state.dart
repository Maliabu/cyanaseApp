import 'package:cyanaseapp/core/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

// we are freezing state for caching
// on login

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool isAuthenticated,
    String? token,
    String? userId,
    User? user, // Can be null before profile fetch
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
    isAuthenticated: false,
    token: null,
    userId: null,
    user: null,
  );
}
