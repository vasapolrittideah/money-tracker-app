import 'dart:io';

import 'package:dio/dio.dart';
import 'package:money_tracker/src/core/errors/api_response.dart';
import 'package:money_tracker/src/core/errors/app_exception.dart';

class ErrorHandler {
  static AppException handle(Object error) => switch (error) {
    DioException e => _handleDioError(e),
    AppException e => e,
    _ => ServerException('Unexpected error occurred'),
  };

  static AppException _handleDioError(DioException error) => switch (error.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.receiveTimeout => const NetworkException('Connection timed out'),

    DioExceptionType.connectionError => const NetworkException('No internet connection'),

    DioExceptionType.badResponse => _handleHttpError(error.response),

    _ => ServerException(error.message ?? 'Unexpected error occurred', statusCode: error.response?.statusCode),
  };

  static AppException _handleHttpError(Response? response) {
    final apiError = _extractApiError(response);

    if (apiError == null) {
      return ServerException('Unexpected error occurred', statusCode: response?.statusCode);
    }

    return mapApiError(apiError);
  }

  static ApiError? _extractApiError(Response? response) {
    try {
      final data = response?.data as Map<String, dynamic>?;
      final errorJson = data?['error'] as Map<String, dynamic>?;
      return errorJson != null ? ApiError.fromJson(errorJson) : null;
    } catch (_) {
      return null;
    }
  }

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
