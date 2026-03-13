import 'package:equatable/equatable.dart';
import 'package:money_tracker/src/core/errors/app_exception.dart';

/// A generic state container used across the app to represent async operation states.
///
/// Unlike Riverpod's [AsyncValue], this class enforces [AppException] as the error
/// type, eliminating the need for unsafe casts when handling errors in the UI.
sealed class AppState<T> extends Equatable {
  const AppState();

  /// Returns `true` if the state is [AppInitial], `false` otherwise.
  bool get isInitial => this is AppInitial<T>;

  /// Returns `true` if the state is [AppLoading], `false` otherwise.
  bool get isLoading => this is AppLoading<T>;

  /// Returns `true` if the state is [AppData], `false` otherwise.
  bool get hasData => this is AppData<T>;

  /// Returns `true` if the state is [AppError], `false` otherwise.
  bool get hasError => this is AppError<T>;

  /// Returns the data if state is [AppData], otherwise `null`.
  T? get dataOrNull => switch (this) {
    AppData(:final data) => data,
    _ => null,
  };

  /// Returns the error if state is [AppError], otherwise `null`.
  AppException? get errorOrNull => switch (this) {
    AppError(:final error) => error,
    _ => null,
  };

  /// Exhaustive pattern match over all states. Every case is required.
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(T data) data,
    required R Function(AppException error) error,
  }) => switch (this) {
    AppInitial() => initial(),
    AppLoading() => loading(),
    AppData(data: final d) => data(d),
    AppError(error: final e) => error(e),
  };

  /// Partial pattern match — unhandled states return `null`.
  R? whenOrNull<R>({
    R Function()? initial,
    R Function()? loading,
    R Function(T data)? data,
    R Function(AppException error)? error,
  }) => switch (this) {
    AppInitial() => initial?.call(),
    AppLoading() => loading?.call(),
    AppData(data: final d) => data?.call(d),
    AppError(error: final e) => error?.call(e),
  };

  /// Partial pattern match — unhandled states fall through to [orElse].
  R maybeWhen<R>({
    R Function()? initial,
    R Function()? loading,
    R Function(T data)? data,
    R Function(AppException error)? error,
    required R Function() orElse,
  }) => switch (this) {
    AppInitial() => initial != null ? initial() : orElse(),
    AppLoading() => loading != null ? loading() : orElse(),
    AppData(data: final d) => data != null ? data(d) : orElse(),
    AppError(error: final e) => error != null ? error(e) : orElse(),
  };

  @override
  List<Object?> get props => [];
}

/// State before any operation has been triggered.
final class AppInitial<T> extends AppState<T> {
  const AppInitial();
}

/// State while an async operation is in progress.
final class AppLoading<T> extends AppState<T> {
  const AppLoading();
}

/// State when an async operation completed successfully.
final class AppData<T> extends AppState<T> {
  const AppData(this.data);

  final T data;

  @override
  List<Object?> get props => [data];
}

/// State when an async operation failed with an [AppException].
final class AppError<T> extends AppState<T> {
  const AppError(this.error);

  final AppException error;

  @override
  List<Object?> get props => [error];
}
