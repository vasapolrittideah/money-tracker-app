import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Utility class providing pre-built [CustomTransitionPage] factories for GoRouter.
class TransitionUtil {
  /// Creates a [CustomTransitionPage] that slides [child] in from the given [direction].
  ///
  /// [direction] determines where the page slides in from:
  /// - [AxisDirection.left]  → slides in from the right (default)
  /// - [AxisDirection.right] → slides in from the left
  /// - [AxisDirection.up]    → slides in from the bottom
  /// - [AxisDirection.down]  → slides in from the top
  static CustomTransitionPage<T> slideTransitionPage<T>({
    required Widget child,
    required GoRouterState state,
    AxisDirection direction = AxisDirection.up,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut;

        // Animate from the starting offset (based on direction) to Offset.zero (fully on screen).
        final tween = Tween<Offset>(
          begin: _getOffsetFromDirection(direction),
          end: Offset.zero,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  /// Creates a [CustomTransitionPage] that fades [child] in from transparent to fully opaque.
  /// [state] is the current [GoRouterState] used to generate a unique key for the page.
  static CustomTransitionPage<T> fadeTransitionPage<T>({required Widget child, required GoRouterState state}) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut;

        // Animate opacity from 0.0 (invisible) to 1.0 (fully visible).
        final tween = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

        return FadeTransition(opacity: animation.drive(tween), child: child);
      },
    );
  }

  /// Maps an [AxisDirection] to the starting [Offset] for a slide transition.
  ///
  /// Offsets are in fractional units relative to the page size (e.g. `Offset(1, 0)`
  /// means one full page-width to the right).
  static Offset _getOffsetFromDirection(AxisDirection direction) {
    return switch (direction) {
      AxisDirection.up => const Offset(0, 1), // enter from bottom
      AxisDirection.down => const Offset(0, -1), // enter from top
      AxisDirection.left => const Offset(1, 0), // enter from right
      AxisDirection.right => const Offset(-1, 0), // enter from left
    };
  }
}
