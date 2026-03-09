import 'dart:io';

sealed class AppException implements Exception {
  const AppException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;
}

class NetworkException extends AppException {
  const NetworkException(super.message) : super(statusCode: null);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException(super.message) : super(statusCode: HttpStatus.unauthorized);
}

class ForbiddenException extends AppException {
  const ForbiddenException(super.message) : super(statusCode: HttpStatus.forbidden);
}

class NotFoundException extends AppException {
  const NotFoundException(super.message) : super(statusCode: HttpStatus.notFound);
}

class ServerException extends AppException {
  const ServerException(super.message, {super.statusCode});
}

class ValidationException extends AppException {
  final Map<String, List<String>> errors;
  const ValidationException(this.errors) : super('Validation failed', statusCode: HttpStatus.badRequest);
}
