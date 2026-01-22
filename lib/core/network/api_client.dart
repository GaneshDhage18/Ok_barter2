import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:okbarter2/core/services/tokens.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dio_error_mapper.dart';

class ApiClient {
  late final Dio dio;

  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://inordinately-serous-maryann.ngrok-free.dev/api/v1',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (Tokens.accessToken != null) {
            options.headers['Authorization'] = 'Bearer ${Tokens.accessToken}';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          final exception = DioErrorMapper.map(error);
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: exception,
            ),
          );
        },
      ),

      PrettyDioLogger(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
        enabled: kDebugMode,
      ),
    ]);
  }
}
