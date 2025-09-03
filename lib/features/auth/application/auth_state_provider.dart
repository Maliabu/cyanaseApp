import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/application/isar_provider.dart';
import 'package:cyanaseapp/features/auth/data/auth_state.dart';
import 'package:cyanaseapp/features/auth/services/secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() => AuthNotifier());

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return AuthState.initial();
  }

  Future<void> loadOnStartup() async {
    final token = await ref.read(secureStorageProvider).getToken();
    final userId = await ref.read(secureStorageProvider).getUserId();
    final api = ApiService();

    if (token == null || userId == null) return;

    // ensures proper wait for isar initialization
    final cachedUser = await ref.read(isarProvider.future);
    final user = cachedUser.getCachedUser();

    state = state.copyWith(
      isAuthenticated: true,
      token: token,
      userId: userId,
      user: await user,
    );

    // Refresh user from server in background
    final updatedUser = await api.getAuthUser(userId, token);
    final cacheUser = await ref.read(isarProvider.future);
    cacheUser.cacheUser(updatedUser.user!);

    state = state.copyWith(user: updatedUser.user);
  }

  Future<void> logout() async {
    await ref.read(secureStorageProvider).clear();
    final clear = await ref.read(isarProvider.future);
    clear.clear();

    state = AuthState.initial();
  }
}

