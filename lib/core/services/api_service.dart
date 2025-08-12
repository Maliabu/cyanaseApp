import 'dart:convert';
import 'package:cyanaseapp/core/data/api_endpoints.dart';
import 'package:cyanaseapp/features/auth/data/login_form_state.dart';
import 'package:cyanaseapp/features/invest/domain/invest_form_state.dart';
import 'package:cyanaseapp/features/invest/models/submission_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl;

  ApiService({String? baseUrl}) : _baseUrl = baseUrl ?? ApiEndpoints.baseUrl;

  // GET request
  Future<List<dynamic>> getList(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // POST request
  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'API Error ${response.statusCode}: ${response.reasonPhrase}',
      );
    }
  }

  Future<SubmissionResponse> investRelworx(InvestFormState formState) async {
    //
    final response = await post('submit', formState.toJson());
    return SubmissionResponse.fromJson(response);
  }

  Future<SubmissionResponse> investFlutterwave(
    InvestFormState formState,
  ) async {
    final response = await post('submit', formState.toJson());
    return SubmissionResponse.fromJson(response);
  }

  Future<SubmissionResponse> login(LoginFormState formState) async {
    final response = await post('login', formState.toJson());
    return SubmissionResponse.fromJson(response);
  }
}
