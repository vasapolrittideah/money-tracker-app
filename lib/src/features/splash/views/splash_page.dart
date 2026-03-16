import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_tracker/src/core/gen/assets.gen.dart';
import 'package:money_tracker/src/core/session/session_notifier.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/feedback/loading_indicator.dart';
import 'package:money_tracker/src/features/account/viewmodels/account_notifier.dart';
import 'package:money_tracker/src/features/splash/viewmodels/splash_notifier.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerDone = useState(false);
    final sessionState = ref.watch(sessionProvider);
    final accountState = ref.watch(accountProvider);

    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () => timerDone.value = true);
      return null;
    }, const []);

    useEffect(() {
      if (!timerDone.value || sessionState.isLoading || accountState.isLoading) {
        return null;
      }

      final account = accountState.dataOrNull;
      if (accountState.hasError || (account != null && !account.verified)) {
        ref.read(sessionProvider.notifier).clearSession();
      }

      ref.read(splashProvider.notifier).complete();

      return null;
    }, [timerDone.value, sessionState, accountState]);

    return Scaffold(
      backgroundColor: context.colors.primaryBase,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Assets.images.logo.svg(width: context.dimensions.dim24.w, color: context.colors.textWhite0),
            ),
            Positioned(
              bottom: context.dimensions.dim10,
              left: 0,
              right: 0,
              child: AppLoadingIndicator(color: context.colors.textWhite0),
            ),
          ],
        ),
      ),
    );
  }
}
