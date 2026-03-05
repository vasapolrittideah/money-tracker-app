import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A type-safe border token set covering border radii and border widths.
///
/// Radius tokens follow a Tailwind-style naming convention. Width tokens range
/// from a hairline 1 px to a thick 4 px stroke.
class AppBorders {
  const AppBorders({
    // Radii
    required this.radiusNone,
    required this.radiusSm,
    required this.radius,
    required this.radiusMd,
    required this.radiusLg,
    required this.radiusXl,
    required this.radius2xl,
    required this.radius3xl,
    required this.radiusFull,
    // Widths
    required this.widthNone,
    required this.widthThin,
    required this.widthBase,
    required this.widthThick,
  });

  // Radii
  final double radiusNone;
  final double radiusSm;
  final double radius;
  final double radiusMd;
  final double radiusLg;
  final double radiusXl;
  final double radius2xl;
  final double radius3xl;
  final double radiusFull;
  // Widths
  final double widthNone;
  final double widthThin;
  final double widthBase;
  final double widthThick;

  /// Convenience getter: circular [BorderRadius] for [radiusSm].
  BorderRadius get radiusSmAll => BorderRadius.circular(radiusSm);

  /// Convenience getter: circular [BorderRadius] for [radius].
  BorderRadius get radiusAll => BorderRadius.circular(radius);

  /// Convenience getter: circular [BorderRadius] for [radiusMd].
  BorderRadius get radiusMdAll => BorderRadius.circular(radiusMd);

  /// Convenience getter: circular [BorderRadius] for [radiusLg].
  BorderRadius get radiusLgAll => BorderRadius.circular(radiusLg);

  /// Convenience getter: circular [BorderRadius] for [radiusXl].
  BorderRadius get radiusXlAll => BorderRadius.circular(radiusXl);

  /// Convenience getter: circular [BorderRadius] for [radius2xl].
  BorderRadius get radius2xlAll => BorderRadius.circular(radius2xl);

  /// Convenience getter: circular [BorderRadius] for [radius3xl].
  BorderRadius get radius3xlAll => BorderRadius.circular(radius3xl);

  /// Convenience getter: circular [BorderRadius] for [radiusFull] (pill shape).
  BorderRadius get radiusFullAll => BorderRadius.circular(radiusFull);

  /// The default border token scale. Values are in logical pixels.
  static const base = AppBorders(
    // Radii
    radiusNone: 0,
    radiusSm: 4,
    radius: 8,
    radiusMd: 12,
    radiusLg: 16,
    radiusXl: 20,
    radius2xl: 24,
    radius3xl: 32,
    radiusFull: 9999,
    // Widths
    widthNone: 0,
    widthThin: 1,
    widthBase: 2,
    widthThick: 4,
  );

  /// Returns a copy of [base] with every radius scaled by [ScreenUtil] (`.r`)
  /// and every width scaled by [ScreenUtil] (`.r`).
  /// [widthThin] is kept at 1 px (hairline — should not scale).
  /// Call this only after `ScreenUtil.init()` has run.
  static AppBorders scaled() => AppBorders(
    radiusNone: 0,
    radiusSm: base.radiusSm.r,
    radius: base.radius.r,
    radiusMd: base.radiusMd.r,
    radiusLg: base.radiusLg.r,
    radiusXl: base.radiusXl.r,
    radius2xl: base.radius2xl.r,
    radius3xl: base.radius3xl.r,
    radiusFull: base.radiusFull.r,
    widthNone: 0,
    widthThin: 1, // hairline — never scale
    widthBase: base.widthBase.r,
    widthThick: base.widthThick.r,
  );
}
