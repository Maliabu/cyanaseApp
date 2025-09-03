import 'package:cyanaseapp/features/auth/services/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isarProvider = FutureProvider<IsarService>((ref) async {
  final service = IsarService();
  await service.init();
  return service;
});
