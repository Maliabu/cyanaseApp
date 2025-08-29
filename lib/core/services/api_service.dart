import 'dart:convert';
import 'package:cyanaseapp/core/config/env.dart';
import 'package:cyanaseapp/core/data/api_endpoints.dart';
import 'package:cyanaseapp/core/data/auth_endpoints.dart';
import 'package:cyanaseapp/features/auth/data/login_form_state.dart';
import 'package:cyanaseapp/features/auth/data/sign_up_form_state.dart';
import 'package:cyanaseapp/features/auth/models/sign_up_request.dart';
import 'package:cyanaseapp/features/auth/models/sign_up_response.dart';
import 'package:cyanaseapp/features/auth/models/verify_email_response.dart';
import 'package:cyanaseapp/features/auth/views/sign_up.dart';
import 'package:cyanaseapp/features/invest/domain/invest_form_state.dart';
import 'package:cyanaseapp/features/invest/models/submission_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl;
  final envUrl = Env.baseUrl;


  ApiService({String? baseUrl}) : _baseUrl = baseUrl ?? ApiEndpoints.baseUrl;

  // GET request
  Future<List<dynamic>> getList(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // POST request
  Future<dynamic> post(
  String endpoint,
  Map<String, dynamic> body, {
  String? token,
  bool isWebUrl = false,
  }) async {
    final url = isWebUrl ? '$envUrl/$endpoint' : '$_baseUrl/$endpoint';
    final headers = {
      'Content-Type': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = 'Token $token';
    }

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
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

  Future<VerifyEmailResponse> verifyEmail(String email) async {
    final response = await post(AuthEndpoints.passwordResetLink, {'email': email});
    return VerifyEmailResponse.fromJson(response);
  }

  Future<VerifyEmailResponse> verifyEmailCode(String email, String verificationCode) async {
    final response = await post(AuthEndpoints.verifyCode, {'email': email, 'code': verificationCode});
    return VerifyEmailResponse.fromJson(response);
  }

  Future<VerifyEmailResponse> resetPassword( String password, String email, String ref) async {
    final response = await post( AuthEndpoints.apiUrlResetPassword, {'email': email, 'password': password, 'ref': ref}, isWebUrl: true);
    return VerifyEmailResponse.fromJson(response);
  }

  Future<VerifyEmailResponse> validateSignUpEmailPhone(String email, String phone) async {
    // not web url meaning its path belongs to /api/v1/en... else just /en/...
    final response = await post(AuthEndpoints.validateuserEmailPhone, {'email': email, 'phone_number': phone});
    return VerifyEmailResponse.fromJson(response);
  }

  Future<SignUpResponse> signUp(SignupRequest form) async {
    final response = await post(AuthEndpoints.signup, form.toJson());
    return SignUpResponse.fromJson(response);
  }

}
