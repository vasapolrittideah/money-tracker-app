import 'package:dio/dio.dart';
import 'package:money_tracker/src/core/errors/api_response.dart';
import 'package:money_tracker/src/core/errors/app_exception.dart';
import 'package:money_tracker/src/core/errors/error_handler.dart';
import 'package:money_tracker/src/core/errors/result.dart';

abstract class BaseRepository {
  Future<Result<T>> execute<T>(Future<Response> Function() call, {T Function(Object? json)? fromJson}) async {
    try {
      final response = await call();

      final envelope = ApiResponse<T>.fromJson(response.data as Map<String, dynamic>, fromJson);

      if (envelope.isSuccess) {
        return Success(envelope.data as T);
      }

      if (envelope.error == null) {
        return Failure(const ServerException('Empty error response'));
      }

      return Failure(ErrorHandler.mapApiError(envelope.error!));
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }
}
