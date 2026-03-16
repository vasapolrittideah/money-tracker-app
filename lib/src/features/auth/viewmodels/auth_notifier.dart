import 'package:money_tracker/src/core/errors/result.dart';
import 'package:money_tracker/src/core/session/session_notifier.dart';
import 'package:money_tracker/src/core/state/app_state.dart';
import 'package:money_tracker/src/features/auth/models/login_with_email.dart';
import 'package:money_tracker/src/features/auth/models/register.dart';
import 'package:money_tracker/src/features/auth/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: false)
class AuthNotifier extends _$AuthNotifier {
  @override
  AppState build() => const AppInitial();

  Future<void> loginWithEmail(LoginWithEmail request) async {
    state = const AppLoading();

    final result = await ref.read(authRepositoryProvider).loginWithEmail(request);

    await result.when(
      success: (session) async {
        await ref.read(sessionProvider.notifier).saveSession(session);
        state = const AppData(null);
      },
      failure: (error) async => state = AppError(error),
    );
  }

  Future<void> register(Register request) async {
    state = const AppLoading();

    final result = await ref.read(authRepositoryProvider).register(request);

    await result.when(
      success: (session) async {
        await ref.read(sessionProvider.notifier).saveSession(session);
        state = const AppData(null);
      },
      failure: (error) async => state = AppError(error),
    );
  }
}
