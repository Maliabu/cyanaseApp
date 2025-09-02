import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) => _storage.write(key: 'token', value: token);
  Future<void> saveUserId(String userId) => _storage.write(key: 'userId', value: userId);
  Future<String?> getToken() => _storage.read(key: 'token');
  Future<String?> getUserId() => _storage.read(key: 'userId');
  Future<void> clear() => _storage.deleteAll();
}

final secureStorageProvider = Provider((ref) => SecureStorage());
