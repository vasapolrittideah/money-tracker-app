import 'dart:io';

/// Base class for all application-level exceptions.
///
/// Subclasses represent specific failure categories (network, auth, server, etc.)
/// and are used as the error payload inside [Failure] results.
sealed class AppException implements Exception {
  const AppException(this.message, {this.statusCode});

  /// A human-readable description of what went wrong.
  final String message;

  /// The HTTP status code associated with this exception, if applicable.
  final int? statusCode;
}

/// Thrown when a network-level failure occurs (e.g. no internet, connection timeout).
///
/// Not associated with an HTTP status code.
class NetworkException extends AppException {
  const NetworkException(super.message) : super(statusCode: null);
}

/// Thrown when the server returns HTTP 401 — the user is not authenticated.
class UnauthorizedException extends AppException {
  const UnauthorizedException(super.message) : super(statusCode: HttpStatus.unauthorized);
}

/// Thrown when the server returns HTTP 403 — the user lacks permission.
class ForbiddenException extends AppException {
  const ForbiddenException(super.message) : super(statusCode: HttpStatus.forbidden);
}

/// Thrown when the server returns HTTP 404 — the requested resource does not exist.
class NotFoundException extends AppException {
  const NotFoundException(super.message) : super(statusCode: HttpStatus.notFound);
}

/// Thrown when the server returns an unexpected error (5xx or other unhandled status).
class ServerException extends AppException {
  const ServerException(super.message, {super.statusCode});
}

/// Thrown when the server returns HTTP 400 due to validation errors.
///
/// [errors] maps each invalid field name to a list of error messages describing
/// why it failed validation.
class ValidationException extends AppException {
  final Map<String, List<String>> errors;
  const ValidationException(this.errors) : super('Validation failed', statusCode: HttpStatus.badRequest);
}
