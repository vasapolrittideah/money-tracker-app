import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/src/core/utils/transition_util.dart';
import 'package:money_tracker/src/features/auth/views/login_with_email_screen.dart';
import 'package:money_tracker/src/features/auth/views/register_screen.dart';
import 'package:money_tracker/src/features/auth/views/select_login_method_screen.dart';
import 'package:money_tracker/src/features/splash/views/splash_screen.dart';

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

  /// The single [GoRouter] instance shared across the entire app.
  ///
  /// Pass this to [MaterialApp.router] via `routerConfig: AppRouter.router`.
  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      // Root route — always the first screen shown on launch.
      GoRoute(
        path: splash,
        pageBuilder: (context, state) => TransitionUtil.slideTransitionPage(state: state, child: const SplashScreen()),
      ),
      GoRoute(
        path: selectLoginMethod,
        pageBuilder: (context, state) =>
            TransitionUtil.slideTransitionPage(state: state, child: const SelectLoginMethodScreen()),
      ),
      GoRoute(
        path: loginWithEmail,
        pageBuilder: (context, state) => TransitionUtil.slideTransitionPage(
          state: state,
          direction: AxisDirection.left,
          child: const LoginWithEmailScreen(),
        ),
      ),
      GoRoute(
        path: register,
        pageBuilder: (context, state) => TransitionUtil.slideTransitionPage(
          state: state,
          direction: AxisDirection.left,
          child: const RegisterScreen(),
        ),
      ),
    ],
  );
}
