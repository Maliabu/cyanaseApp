import 'package:dio/dio.dart';
import 'dart:async';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int retries;
  final List<Duration> retryDelays;

  RetryInterceptor({
    required this.dio,
    this.retries = 3,
    this.retryDelays = const [
      Duration(seconds: 1),
      Duration(seconds: 2),
      Duration(seconds: 3),
    ],
  });

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final requestOptions = err.requestOptions;

    // Only retry for certain types of errors, e.g., timeout or socket exceptions
    bool shouldRetry = err.type == DioExceptionType.connectionTimeout ||
                       err.type == DioExceptionType.receiveTimeout ||
                       err.type == DioExceptionType.sendTimeout ||
                       err.type == DioExceptionType.connectionError;

    if (!shouldRetry || retries <= 0) {
      return handler.next(err);
    }

    for (int attempt = 0; attempt < retries; attempt++) {
      try {
        await Future.delayed(retryDelays[attempt]);

        final response = await dio.request(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
            responseType: requestOptions.responseType,
          ),
        );

        return handler.resolve(response);
      } catch (e) {
        // On final failure, pass the error
        if (attempt == retries - 1) {
          return handler.next(err);
        }
      }
    }
  }
}
