import 'package:cyanaseapp/core/models/user.dart';
import 'package:cyanaseapp/features/auth/models/user_entity.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late final Isar _isar;

  Future<void> init() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      _isar = await Isar.open(
        [UserEntitySchema],
        directory: dir.path,
      );
    } else {
      _isar = Isar.getInstance()!;
    }
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
