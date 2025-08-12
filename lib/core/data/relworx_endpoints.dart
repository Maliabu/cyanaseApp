import 'package:cyanaseapp/core/data/api_endpoints.dart';

class AuthEndpoints {
  static final baseUrl = ApiEndpoints.baseUrl;

  static final validatePhoneNumber = '$baseUrl/valiadte/mm/number';
  static final requestPayment = '$baseUrl/request/payment';
  // Add more endpoints here
}
