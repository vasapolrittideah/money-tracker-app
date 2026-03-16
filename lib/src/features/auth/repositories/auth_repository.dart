import 'package:money_tracker/src/core/bases/base_repository.dart';
import 'package:money_tracker/src/core/errors/result.dart';
import 'package:money_tracker/src/core/network/api_client.dart';
import 'package:money_tracker/src/features/auth/models/login_with_email.dart';
import 'package:money_tracker/src/features/auth/models/register.dart';
import 'package:money_tracker/src/core/session/session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

part 'auth_repository_impl.dart';

/// Contract for authentication operations.
abstract interface class AuthRepository {
  /// Creates a new user account using the provided [request] details.
  Future<Result<Session>> register(Register request);

  /// Authenticates an existing user with email and password from [request].
  Future<Result<Session>> loginWithEmail(LoginWithEmail request);

  /// Ends the current user session and invalidates the stored token.
  Future<Result<void>> logout();
}
