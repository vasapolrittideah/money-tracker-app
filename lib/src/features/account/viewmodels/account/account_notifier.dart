import 'package:money_tracker/src/core/errors/result.dart';
import 'package:money_tracker/src/core/session/session_notifier.dart';
import 'package:money_tracker/src/core/state/app_state.dart';
import 'package:money_tracker/src/features/account/models/account/account.dart';
import 'package:money_tracker/src/features/account/repositories/account/account_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_notifier.g.dart';

@Riverpod(keepAlive: true)
class AccountNotifier extends _$AccountNotifier {
  @override
  AppState<Account> build() {
    ref.listen(sessionProvider, (_, next) {
      if (next.value != null) {
        loadAccount();
      } else {
        state = const AppInitial();
      }
    });

    return const AppInitial();
  }

  Future<void> loadAccount() async {
    state = const AppLoading();

    final result = await ref.read(accountRepositoryProvider).getCurrentAccount();

    result.when(success: (account) => state = AppData(account), failure: (error) => state = AppError(error));
  }
}
