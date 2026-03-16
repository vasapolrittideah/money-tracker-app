import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/src/core/session/session_notifier.dart';
import 'package:money_tracker/src/core/utils/transition_util.dart';
import 'package:money_tracker/src/core/widgets/navigation/navbar.dart';
import 'package:money_tracker/src/features/account/notifiers/account_notifier.dart';
import 'package:money_tracker/src/features/auth/views/login_with_email_page.dart';
import 'package:money_tracker/src/features/auth/views/register_page.dart';
import 'package:money_tracker/src/features/auth/views/select_login_method_page.dart';
import 'package:money_tracker/src/features/auth/views/verify_email_page.dart';
import 'package:money_tracker/src/features/splash/notifiers/splash_notifier.dart';
import 'package:money_tracker/src/features/splash/views/splash_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Centralized routing configuration for the app using [GoRouter].
///
/// All routes are declared here as a single source of truth.
/// Use [AppRouter.router] to obtain the [GoRouter] instance.
class AppRouter {
  // Prevent instantiation — this class is used as a namespace only.
  AppRouter._();

  static const String splash = '/';
  static const String selectLoginMethod = '/select-login-method';
  static const String loginWithEmail = '/login-with-email';
  static const String register = '/register';
  static const String verifyEmail = '/verify-email';

  /// The single [GoRouter] instance shared across the entire app.
  ///
  /// Pass this to [MaterialApp.router] via `routerConfig: AppRouter.router`.
  static GoRouter router(ProviderContainer container) => GoRouter(
    initialLocation: splash,
    refreshListenable: _RouterNotifier(container),
    redirect: (context, state) {
      debugPrint('GoRouter redirect: ${state.matchedLocation}');

      final splashDone = container.read(splashProvider);
      if (!splashDone) {
        return state.matchedLocation == splash ? null : splash;
      }

      final session = container.read(sessionProvider).value;
      final accountState = container.read(accountProvider);
      final isAuthenticated = session != null;
      final isAuthRoute = [selectLoginMethod, loginWithEmail, register, verifyEmail].contains(state.matchedLocation);

      if (!isAuthenticated && !isAuthRoute) {
        return selectLoginMethod;
      }

      if (isAuthenticated) {
        final account = accountState.dataOrNull;
        if (account != null && isAuthRoute) {
          return account.verified
              ? '/home' // TODO: replace with actual home route when implemented
              : verifyEmail;
        }
      }

      return null;
    },
    routes: [
      // Root route — always the first page shown on launch.
      GoRoute(
        path: splash,
        pageBuilder: (context, state) => TransitionUtil.slideTransitionPage(state: state, child: const SplashPage()),
      ),
      GoRoute(
        path: selectLoginMethod,
        pageBuilder: (context, state) =>
            TransitionUtil.slideTransitionPage(state: state, child: const SelectLoginMethodPage()),
      ),
      GoRoute(
        path: loginWithEmail,
        pageBuilder: (context, state) => TransitionUtil.slideTransitionPage(
          state: state,
          direction: AxisDirection.left,
          child: const LoginWithEmailPage(),
        ),
      ),
      GoRoute(
        path: register,
        pageBuilder: (context, state) => TransitionUtil.slideTransitionPage(
          state: state,
          direction: AxisDirection.left,
          child: const RegisterPage(),
        ),
      ),
      GoRoute(
        path: verifyEmail,
        pageBuilder: (context, state) => TransitionUtil.slideTransitionPage(
          state: state,
          direction: AxisDirection.left,
          child: const VerifyEmailPage(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const Scaffold(body: Center(child: Text('Home Screen'))),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/transactions',
                builder: (context, state) => const Scaffold(body: Center(child: Text('Transactions Screen'))),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const Scaffold(body: Center(child: Text('Settings Screen'))),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class _RouterNotifier extends ChangeNotifier {
  _RouterNotifier(ProviderContainer container) {
    container.listen(splashProvider, (_, _) => notifyListeners());
    container.listen(sessionProvider, (_, _) => notifyListeners());
    container.listen(accountProvider, (_, _) => notifyListeners());
  }
}
