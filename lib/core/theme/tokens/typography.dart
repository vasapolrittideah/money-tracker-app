import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Defines all text styles used throughout the app.
///
/// Styles are split into three categories:
/// - **Title** — large display text (H1–H6), semi-bold (w500).
/// - **Label** — interactive / UI labels (buttons, tabs, badges), semi-bold (w500).
/// - **Paragraph** — body / reading text, regular weight (w400).
///
/// The numeric suffix in each name corresponds to the font size in points
/// (e.g. [titleH1] is 56 pt, [labelMedium] is 16 pt).
///
/// Line-height is expressed as a ratio (`height = line-height / font-size`)
/// so Flutter scales it correctly at any size.
class AppTypography {
  const AppTypography({
    required this.titleH1,
    required this.titleH2,
    required this.titleH3,
    required this.titleH4,
    required this.titleH5,
    required this.titleH6,
    required this.labelXLarge,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.labelXSmall,
    required this.paragraphXLarge,
    required this.paragraphLarge,
    required this.paragraphMedium,
    required this.paragraphSmall,
    required this.paragraphXSmall,
  });

  // Titles
  final TextStyle titleH1;
  final TextStyle titleH2;
  final TextStyle titleH3;
  final TextStyle titleH4;
  final TextStyle titleH5;
  final TextStyle titleH6;

  // Labels
  final TextStyle labelXLarge;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;
  final TextStyle labelXSmall;

  // Paragraphs
  final TextStyle paragraphXLarge;
  final TextStyle paragraphLarge;
  final TextStyle paragraphMedium;
  final TextStyle paragraphSmall;
  final TextStyle paragraphXSmall;

  /// Returns a copy of [base] with every [TextStyle.fontSize] scaled by
  /// [ScreenUtil] (`.sp`). Call this only after `ScreenUtil.init()` has run.
  static AppTypography scaled() => AppTypography(
    titleH1: base.titleH1.copyWith(fontSize: base.titleH1.fontSize!.sp),
    titleH2: base.titleH2.copyWith(fontSize: base.titleH2.fontSize!.sp),
    titleH3: base.titleH3.copyWith(fontSize: base.titleH3.fontSize!.sp),
    titleH4: base.titleH4.copyWith(fontSize: base.titleH4.fontSize!.sp),
    titleH5: base.titleH5.copyWith(fontSize: base.titleH5.fontSize!.sp),
    titleH6: base.titleH6.copyWith(fontSize: base.titleH6.fontSize!.sp),
    labelXLarge: base.labelXLarge.copyWith(fontSize: base.labelXLarge.fontSize!.sp),
    labelLarge: base.labelLarge.copyWith(fontSize: base.labelLarge.fontSize!.sp),
    labelMedium: base.labelMedium.copyWith(fontSize: base.labelMedium.fontSize!.sp),
    labelSmall: base.labelSmall.copyWith(fontSize: base.labelSmall.fontSize!.sp),
    labelXSmall: base.labelXSmall.copyWith(fontSize: base.labelXSmall.fontSize!.sp),
    paragraphXLarge: base.paragraphXLarge.copyWith(fontSize: base.paragraphXLarge.fontSize!.sp),
    paragraphLarge: base.paragraphLarge.copyWith(fontSize: base.paragraphLarge.fontSize!.sp),
    paragraphMedium: base.paragraphMedium.copyWith(fontSize: base.paragraphMedium.fontSize!.sp),
    paragraphSmall: base.paragraphSmall.copyWith(fontSize: base.paragraphSmall.fontSize!.sp),
    paragraphXSmall: base.paragraphXSmall.copyWith(fontSize: base.paragraphXSmall.fontSize!.sp),
  );

  /// The font family used for all text styles.
  static const _fontFamily = 'Roboto';

  /// The default typography scale. Use this as the single source of truth for
  /// all text styles; override individual styles at the widget level only when
  /// strictly necessary.
  static const base = AppTypography(
    // Title
    titleH1: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 56,
      fontWeight: FontWeight.w500,
      height: 64 / 56,
      letterSpacing: -0.01,
    ),
    titleH2: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 48,
      fontWeight: FontWeight.w500,
      height: 56 / 48,
      letterSpacing: -0.01,
    ),
    titleH3: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 40,
      fontWeight: FontWeight.w500,
      height: 48 / 40,
      letterSpacing: -0.01,
    ),
    titleH4: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w500,
      height: 40 / 32,
      letterSpacing: -0.005,
    ),
    titleH5: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 32 / 24,
      letterSpacing: 0,
    ),
    titleH6: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 28 / 20,
      letterSpacing: 0,
    ),

    // Label
    labelXLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 32 / 24,
      letterSpacing: -0.015,
    ),
    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 24 / 18,
      letterSpacing: -0.015,
    ),
    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 24 / 16,
      letterSpacing: -0.011,
    ),
    labelSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 20 / 14,
      letterSpacing: -0.006,
    ),
    labelXSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 16 / 12,
      letterSpacing: 0,
    ),

    // Paragraph
    paragraphXLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      height: 32 / 24,
      letterSpacing: -0.015,
    ),
    paragraphLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 24 / 18,
      letterSpacing: -0.015,
    ),
    paragraphMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: -0.011,
    ),
    paragraphSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 20 / 14,
      letterSpacing: -0.006,
    ),
    paragraphXSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 16 / 12,
      letterSpacing: 0,
    ),
  );
}
