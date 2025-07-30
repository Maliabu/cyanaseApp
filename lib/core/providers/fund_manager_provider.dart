import 'package:cyanaseapp/core/models/fund_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_provider.dart';

final fundManagerProvider = FutureProvider<List<FundManager>>((ref) async {
  final api = ref.read(apiServiceProvider);
  final data = await api.getList('fund-managers');
  return data.map<FundManager>((e) => FundManager.fromJson(e)).toList();
});
