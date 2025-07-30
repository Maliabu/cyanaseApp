import 'package:cyanaseapp/core/models/investment_class.dart';
import 'package:cyanaseapp/core/providers/api_provider.dart';
import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final investmentClassProvider = FutureProvider<List<InvestmentClass>>((
  ref,
) async {
  final selectedFundManager = ref.watch(investFormProvider).selectedFundManager;
  final api = ref.read(apiServiceProvider);
  final response = await api.post('auth/get/investment/class', {
    'fid': selectedFundManager?.userId,
  });
  final data = response['data'] as List<dynamic>;
  return data.map<InvestmentClass>((e) => InvestmentClass.fromJson(e)).toList();
});
