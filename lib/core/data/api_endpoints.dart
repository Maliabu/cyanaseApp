import 'package:cyanaseapp/core/config/env.dart';

class ApiEndpoints {
  static final envUrl = Env.baseUrl;
  static final baseUrl = '$envUrl/api/v1';

  static final getFundManagers = '$baseUrl/auth/fundmanagers/all';
  static final getInvestmentClassoptions =
      '$baseUrl/auth/get/investment/class/options';
  static final getFundInvestmentClasses =
      '$baseUrl/auth/get/fund/investment/class';
  // Add more endpoints here
}
