import 'package:cyanaseapp/core/data/api_endpoints.dart';
import 'package:cyanaseapp/core/models/investment_class_option.dart';
import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final investmentClassOptionProvider =
    FutureProvider<List<InvestmentClassOption>>((ref) async {
      final selectedinvestmentClass =
          ref.watch(investFormProvider).selectedInvestmentClass?.name;
      final selectedFundManager =
          ref.watch(investFormProvider).selectedFundManager?.userId;
      final api = ApiService();
      final response = await api.post(ApiEndpoints.getInvestmentClassoptions, {
        "class": selectedinvestmentClass,
        "fund_id": selectedFundManager,
      });
      final data = response['data'] as List<dynamic>;
      return data
          .map<InvestmentClassOption>((e) => InvestmentClassOption.fromJson(e))
          .toList();
    });
