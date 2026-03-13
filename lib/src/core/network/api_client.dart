import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:money_tracker/src/core/config/app_config.dart';
import 'package:money_tracker/src/core/session/session.dart';
import 'package:money_tracker/src/core/session/session_notifier.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

part 'api_client.g.dart';

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  final appConfig = ref.watch(appConfigProvider);
  return ApiClient(ref, baseUrl: appConfig.apiUrl, enableLogger: appConfig.isDevelopment);
}

class ApiClient {
  ApiClient(Ref ref, {required String baseUrl, bool enableLogger = false}) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        responseType: ResponseType.json,
        contentType: Headers.jsonContentType,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final session = await ref.read(sessionProvider.future);
          if (session != null) {
            options.headers.addAll(_tokenHeader(session));
          }
          options.headers.addAll(await userAgentClientHintsHeader());
          return handler.next(options);
        },
      ),
    );

    if (kDebugMode && enableLogger) {
      dio.interceptors.add(
        PrettyDioLogger(
          request: true,
          requestBody: true,
          responseBody: false,
          error: true,
          compact: true,
          maxWidth: 120,
        ),
      );
    }
  }

  late Dio dio;

  Map<String, String> _tokenHeader(Session session) {
    return {'Authorization': 'Bearer ${session.accessToken}'};
  }
}
