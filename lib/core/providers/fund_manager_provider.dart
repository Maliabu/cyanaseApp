import 'package:cyanaseapp/core/models/fund_manager.dart';
import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fundManagerProvider = FutureProvider<List<FundManager>>((ref) async {
  final api = ApiService();
  final data = await api.get('auth/fundmanagers/all');
  return data.map<FundManager>((e) => FundManager.fromJson(e)).toList();
});
