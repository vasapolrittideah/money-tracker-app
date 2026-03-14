import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_tracker/src/app_router.dart';
import 'package:money_tracker/src/core/gen/assets.gen.dart';
import 'package:money_tracker/src/core/session/session_notifier.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/feedback/loading_indicator.dart';
import 'package:money_tracker/src/features/auth/viewmodels/account/account_notifier.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerDone = useState(false);
    final session = ref.watch(sessionProvider);
    final accountState = ref.watch(accountProvider);

    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () => timerDone.value = true);
      return null;
    }, const []);

    useEffect(() {
      if (!timerDone.value) return null;

      // Session still loading — wait
      if (session.isLoading) return null;

      // No session — go to selectLoginMethod
      if (session.value == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) context.go(AppRouter.selectLoginMethod);
        });
        return null;
      }

      // Session exists but account is still loading — wait
      if (accountState.isLoading) return null;

      // Account failed to load — clear session and go to selectLoginMethod
      if (accountState.hasError) {
        ref.read(sessionProvider.notifier).clearSession();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) context.go(AppRouter.selectLoginMethod);
        });
        return null;
      }

      // Account loaded but email not verified — clear session and go to selectLoginMethod
      final account = accountState.dataOrNull;
      if (account != null && !account.verified) {
        ref.read(sessionProvider.notifier).clearSession();
      }

      // Account loaded and email verified — go to selectLoginMethod and let
      // the router redirect to the correct page
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) context.go(AppRouter.selectLoginMethod);
      });
      return null;
    }, [timerDone.value, session, accountState]);

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
