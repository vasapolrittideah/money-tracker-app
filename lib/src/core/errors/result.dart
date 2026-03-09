import 'package:money_tracker/src/core/errors/app_exception.dart';

/// Represents the outcome of an operation that can either succeed or fail.
///
/// Use [Success] when the operation completes successfully, and [Failure] when
/// it encounters an error. This pattern avoids throwing exceptions and makes
/// error handling explicit at the call site.
sealed class Result<T> {
  const Result();
}

/// Indicates that the operation completed successfully, carrying a [data] value.
class Success<T> extends Result<T> {
  const Success(this.data);

  final T data;
}

/// Indicates that the operation failed, carrying an [AppException] describing the error.
class Failure<T> extends Result<T> {
  const Failure(this.error);

  final AppException error;
}

extension ResultX<T> on Result<T> {
  /// Returns `true` if this result is a [Success].
  bool get isSuccess => this is Success<T>;

  /// Returns `true` if this result is a [Failure].
  bool get isFailure => this is Failure<T>;

  /// Returns the success data, or `null` if this result is a [Failure].
  T? get dataOrNull => switch (this) {
    Success(:final data) => data,
    Failure() => null,
  };

  /// Handles both outcomes by providing a [success] and a [failure] callback,
  /// returning their common type [R].
  R when<R>({required R Function(T data) success, required R Function(AppException error) failure}) => switch (this) {
    Success(:final data) => success(data),
    Failure(:final error) => failure(error),
  };
}
