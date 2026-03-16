import 'package:money_tracker/src/core/bases/base_repository.dart';
import 'package:money_tracker/src/core/errors/result.dart';
import 'package:money_tracker/src/core/network/api_client.dart';
import 'package:money_tracker/src/features/auth/models/verify_email.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_verification_repository_impl.dart';
part 'email_verification_repository.g.dart';

/// Contract for email verification operations.
abstract interface class EmailVerificationRepository {
  /// Sends a verification email to the user's registered email address.
  Future<Result<void>> sendVerificationEmail();

  /// Verifies the user's email using the provided [request] details.
  Future<Result<void>> verifyEmail(VerifyEmail request);
}
