import 'package:dio/dio.dart';
import 'dart:async';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final List<Duration> retryDelays;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.retryDelays = const [
      Duration(seconds: 1),
      Duration(seconds: 2),
      Duration(seconds: 3),
    ],
  });

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final requestOptions = err.requestOptions;

    // Only retry for network-related errors
    final isNetworkError = err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.connectionError;

    // Get retry count from extra or default to 0
    final currentRetry = requestOptions.extra['retryCount'] as int? ?? 0;

    if (!isNetworkError || currentRetry >= maxRetries) {
      print('[RetryInterceptor] Giving up after $currentRetry retries.');
      return handler.next(err);
    }

    // Wait before retry
    final delay = retryDelays.length > currentRetry
        ? retryDelays[currentRetry]
        : retryDelays.last;

    print('[RetryInterceptor] Attempt ${currentRetry + 1}/$maxRetries after ${delay.inSeconds}s: ${requestOptions.uri}');
    await Future.delayed(delay);

    // Retry with incremented retryCount
    final updatedOptions = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
      responseType: requestOptions.responseType,
      contentType: requestOptions.contentType,
      sendTimeout: requestOptions.sendTimeout,
      receiveTimeout: requestOptions.receiveTimeout,
      extra: Map<String, dynamic>.from(requestOptions.extra)
        ..['retryCount'] = currentRetry + 1,
    );

    try {
      final response = await dio.request(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: updatedOptions,
      );

      return handler.resolve(response);
    } catch (e) {
      // Pass along the final error
      return handler.next(err);
    }
  }
}
