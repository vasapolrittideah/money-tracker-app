import 'package:flutter/material.dart';

/// Predefined box shadow styles for the app's elevation system.
///
/// Shadow tokens are named by size — [xs] for the subtlest lift and
/// [sm] for a slightly more prominent elevation. Apply them via
/// [BoxDecoration.boxShadow] to give surfaces a consistent depth.
class AppShadows {
  const AppShadows({required this.xs, required this.sm});

  final List<BoxShadow> xs;
  final List<BoxShadow> sm;

  /// The default shadow definitions used across the app.
  static const base = AppShadows(
    xs: [BoxShadow(color: Color(0x080A0D14), offset: Offset(0, 1), blurRadius: 2, spreadRadius: 0)],
    sm: [BoxShadow(color: Color(0x0A1B1C1D), offset: Offset(0, 2), blurRadius: 4, spreadRadius: 0)],
  );
}
