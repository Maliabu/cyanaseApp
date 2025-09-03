import 'package:flutter/foundation.dart'; // kIsWeb
import 'package:path_provider/path_provider.dart'; // Only for mobile
import 'package:isar/isar.dart';
import 'package:cyanaseapp/core/models/user.dart';
import 'package:cyanaseapp/features/auth/models/user_entity.dart';

class IsarService {
  late final Isar _isar;

  static const _isarDbName = 'main';

  Future<void> init() async {
    print('kIsWeb: $kIsWeb');

    if (Isar.instanceNames.isEmpty) {
      if (kIsWeb) {
        _isar = await Isar.open(
          [UserEntitySchema],
          name: _isarDbName,
          inspector: true, directory: '',
        );
      } else {
        final dir = await getApplicationDocumentsDirectory();
        _isar = await Isar.open(
          [UserEntitySchema],
          name: _isarDbName,
          directory: dir.path,
          inspector: true,
        );
      }
    } else {
      _isar = Isar.getInstance(_isarDbName)!;
    }
  }

  static Future<IsarService> create() async {
    final service = IsarService();
    await service.init();
    return service;
  }

  Future<void> cacheUser(User user) async {
    final entity = UserEntity()..fromFreezed(user);
    await _isar.writeTxn(() => _isar.userEntitys.put(entity));
  }

  Future<User?> getCachedUser() async {
    final users = await _isar.userEntitys.where().findAll();
    if (users.isEmpty) return null;
    return users.first.toFreezed();
  }

  Future<void> clear() async {
    await _isar.writeTxn(() => _isar.clear());
  }
}
