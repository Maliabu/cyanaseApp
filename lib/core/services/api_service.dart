import 'package:cyanaseapp/core/config/env.dart';
import 'package:cyanaseapp/core/data/api_endpoints.dart';
import 'package:cyanaseapp/core/data/auth_endpoints.dart';
import 'package:cyanaseapp/core/services/dio_logging_interceptors.dart';
import 'package:cyanaseapp/core/services/dio_retry_interceptor.dart';
import 'package:cyanaseapp/features/auth/data/formstates/login_form_state.dart';
import 'package:cyanaseapp/features/auth/models/sign_up_request.dart';
import 'package:cyanaseapp/features/auth/models/sign_up_response.dart';
import 'package:cyanaseapp/features/auth/models/verify_email_response.dart';
import 'package:cyanaseapp/features/invest/domain/invest_form_state.dart';
import 'package:cyanaseapp/features/invest/models/submission_response.dart';
import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = ApiEndpoints.baseUrl;
  final envUrl = Env.baseUrl;
  final Dio _dio;

  ApiService() : _dio = Dio() {
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.interceptors.add(LoggingInterceptor());
    _dio.interceptors.add(
      RetryInterceptor(
        dio: _dio,
        retryDelays: [Duration(seconds: 1), Duration(seconds: 2), Duration(seconds: 4)],
      ),
    );
  }


  // GET request
  Future<List<dynamic>> get(String endpoint) async {
    CancelToken cancelToken = CancelToken();
    try {
      final response = await _dio.get(endpoint, cancelToken: cancelToken);
      cancelToken.cancel("User navigated away");

      // Dio automatically parses JSON response into Map if responseType = json
      return response.data;
    } on DioException catch (e) {
      // Better error info than http package
      if (e.response != null) {
        throw Exception(
          'API Error ${e.response?.statusCode}: ${e.response?.statusMessage}',
        );
      } else {
        throw Exception('API request failed: ${e.message}');
      }
    }
  }

  //POST
  Future<dynamic> post(
    String endpoint,
    Map<String, dynamic> body, {
    String? token,
    bool isWebUrl = false,
  }) async {
    final url = isWebUrl ? '$envUrl/$endpoint' : '$_baseUrl/$endpoint';

    // Add token if exists
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Token $token';
    } else {
      _dio.options.headers.remove('Authorization');
    }

    try {
      final response = await _dio.post(url, data: body);

      // dio auto parses json
      return response.data;
    } on DioException catch (e) {
    final message = e.response?.data['message'] ?? e.message;
    throw Exception(message);
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

  Future<SignUpResponse> loginWithPasscode(String passcode, String email) async {
    final response = await post(AuthEndpoints.passcodeLogin, {'password': passcode, 'email': email});
    return SignUpResponse.fromJson(response);
  }

  Future<SignUpResponse> loginWithPhone(String password, String phone) async {
    final response = await post(AuthEndpoints.passcodeLogin, {'phone': phone, 'password': password});
    return SignUpResponse.fromJson(response);
  }

  Future<SignUpResponse> getAuthUser(String userId, String token) async {
    final response = await post(AuthEndpoints.apiUrlGetAuthUserByEmail, {'user_id': userId}, token: token);
    return SignUpResponse.fromJson(response);
  }

}
