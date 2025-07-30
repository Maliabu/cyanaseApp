import 'package:cyanaseapp/core/data/api_endpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(baseUrl: ApiEndpoints.baseUrl);
});
