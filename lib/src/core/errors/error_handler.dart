import 'dart:io';

import 'package:dio/dio.dart';
import 'package:money_tracker/src/core/errors/api_response.dart';
import 'package:money_tracker/src/core/errors/app_exception.dart';

/// Centralises error handling by converting raw exceptions into typed [AppException] subclasses.
///
/// All network calls should route their caught errors through [handle] so that
/// the rest of the app only ever deals with [AppException] values.
class ErrorHandler {
  /// Converts any [error] thrown during a network call into a typed [AppException].
  static AppException handle(Object error) => switch (error) {
    DioException e => _handleDioError(e),
    AppException e => e,
    _ => ServerException('เกิดข้อผิดพลาดที่ไม่คาดคิด'),
  };

  /// Maps a [DioException] to an [AppException] based on its [DioExceptionType].
  static AppException _handleDioError(DioException error) => switch (error.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.receiveTimeout => const NetworkException('การเชื่อมต่อหมดเวลา'),

    DioExceptionType.connectionError => const NetworkException('ไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้'),

    DioExceptionType.badResponse => _handleHttpError(error.response),

    _ => ServerException(error.message ?? 'เกิดข้อผิดพลาดที่ไม่คาดคิด', statusCode: error.response?.statusCode),
  };

  /// Handles an HTTP error [response] by attempting to parse the server's error payload.
  ///
  /// If an [ApiError] can be extracted from the response body, it is mapped via
  /// [mapApiError]. Otherwise a generic [ServerException] is returned.
  static AppException _handleHttpError(Response? response) {
    final apiError = _extractApiError(response);

    if (apiError == null) {
      return ServerException('Unexpected error occurred', statusCode: response?.statusCode);
    }

    return mapApiError(apiError);
  }

  /// Attempts to parse an [ApiError] from the `error` key in the response body.
  ///
  /// Returns `null` if the response is missing, malformed, or does not contain
  /// an `error` object.
  static ApiError? _extractApiError(Response? response) {
    try {
      final data = response?.data as Map<String, dynamic>?;
      final errorJson = data?['error'] as Map<String, dynamic>?;
      return errorJson != null ? ApiError.fromJson(errorJson) : null;
    } catch (_) {
      return null;
    }
  }

  /// Maps a parsed [ApiError] to the corresponding typed [AppException].
  static AppException mapApiError(ApiError error) => switch (error.statusCode) {
    HttpStatus.unauthorized => UnauthorizedException(error.message),
    HttpStatus.forbidden => ForbiddenException(error.message),
    HttpStatus.notFound => NotFoundException(error.message),
    HttpStatus.badRequest when error.details.isNotEmpty => ValidationException({
      for (final detail in error.details) detail.field: [detail.message],
    }),
    _ => ServerException(error.message, statusCode: error.statusCode),
  };
}
