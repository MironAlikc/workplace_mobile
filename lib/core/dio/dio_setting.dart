import "dart:async";

import "package:dio/dio.dart";
import "package:flutter/foundation.dart";

class DioSettings {
  DioSettings() {
    setup();
  }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://sndbox.avn.kg/wp/api/mobile/v1/',
      contentType: 'application/json',
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 40),
      receiveTimeout: const Duration(seconds: 40),
    ),
  );

  Future<void> setup() async {
    final interceptors = dio.interceptors;

    interceptors.cast();

    final logInterceptor = LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );
    final headerInterceptors = QueuedInterceptorsWrapper(
      onRequest: (options, handler) => handler.next(options),
      onError: (DioException error, handler) {
        handler.next(error);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
    );
    interceptors.addAll([if (kDebugMode) logInterceptor, headerInterceptors]);
    
  }
}
