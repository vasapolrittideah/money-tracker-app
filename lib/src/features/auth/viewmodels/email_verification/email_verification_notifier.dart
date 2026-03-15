import 'package:money_tracker/src/core/errors/result.dart';
import 'package:money_tracker/src/core/state/app_state.dart';
import 'package:money_tracker/src/features/auth/models/verify_email/verify_email.dart';
import 'package:money_tracker/src/features/auth/repositories/email_verification/email_verification_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_verification_notifier.g.dart';

@riverpod
class EmailVerificationNotifier extends _$EmailVerificationNotifier {
  @override
  AppState build() => const AppInitial();

  Future<void> sendVerificationEmail() async {
    state = const AppLoading();

    final result = await ref.read(emailVerificationRepositoryProvider).sendVerificationEmail();

    result.when(success: (_) => state = const AppData(null), failure: (error) => state = AppError(error));
  }

  Future<void> verifyEmail(VerifyEmail request) async {
    state = const AppLoading();

    final result = await ref.read(emailVerificationRepositoryProvider).verifyEmail(request);

    result.when(success: (_) => state = const AppData(null), failure: (error) => state = AppError(error));
  }
}
