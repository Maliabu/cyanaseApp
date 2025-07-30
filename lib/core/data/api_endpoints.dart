class ApiEndpoints {
  static const baseUrl = 'https://localhost:8000/api/v1';

  static const getFundManagers = '$baseUrl/auth/fundmanagers/all';
  static const getPortfolio = '$baseUrl/portfolios';
  static const getInvestmentClassoptions =
      '$baseUrl/auth/get/investment/class/options';
  static const getFundInvestmentClasses =
      '$baseUrl/auth/get/fund/investment/class';
  // Add more endpoints here
}
