import 'package:money_tracker/src/core/errors/app_exception.dart';

sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  const Success(this.data);

  final T data;
}

class Failure<T> extends Result<T> {
  const Failure(this.error);

  final AppException error;
}

extension ResultX<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get dataOrNull => switch (this) {
    Success(:final data) => data,
    Failure() => null,
  };

  R when<R>({required R Function(T data) success, required R Function(AppException error) failure}) => switch (this) {
    Success(:final data) => success(data),
    Failure(:final error) => failure(error),
  };
}
