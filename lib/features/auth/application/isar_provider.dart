import 'package:cyanaseapp/features/auth/services/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isarProvider = Provider<IsarService>((ref) {
  final service = IsarService();
  service.init(); // optional: await elsewhere
  return service;
});
