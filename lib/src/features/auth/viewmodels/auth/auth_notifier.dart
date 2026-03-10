import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/core/errors/app_exception.dart';
import 'package:money_tracker/src/core/errors/result.dart';
import 'package:money_tracker/src/core/session/session_notifier.dart';
import 'package:money_tracker/src/features/auth/models/login_with_email/login_with_email.dart';
import 'package:money_tracker/src/features/auth/models/register/register.dart';
import 'package:money_tracker/src/features/auth/repositories/auth/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.dart';
part 'auth_notifier.freezed.dart';
part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() => const AuthState.initial();

  Future<void> loginWithEmail(LoginWithEmail request) async {
    state = const AuthState.loading();

    final result = await ref.read(authRepositoryProvider).loginWithEmail(request);

    result.when(
      success: (session) async {
        await ref.read(sessionProvider.notifier).saveSession(session);
        state = const AuthState.authenticated();
      },
      failure: (error) => state = AuthState.error(error),
    );
  }

  Future<void> register(Register request) async {
    state = const AuthState.loading();

    final result = await ref.read(authRepositoryProvider).register(request);

    result.when(
      success: (session) async {
        await ref.read(sessionProvider.notifier).saveSession(session);
        state = const AuthState.authenticated();
      },
      failure: (error) => state = AuthState.error(error),
    );
  }
}
