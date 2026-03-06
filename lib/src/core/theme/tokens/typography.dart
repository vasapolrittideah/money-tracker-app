import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracker/src/core/gen/fonts.gen.dart';

/// Defines all text styles used throughout the app.
///
/// Styles follow a size-based scale where [textBase] is 14 pt.
/// All styles default to regular weight (w400) — use [TextStyle.copyWith]
/// to change [FontWeight] at the call site:
///
/// ```dart
/// context.typography.textBase.copyWith(fontWeight: FontWeight.w600)
/// ```
///
/// Line-height is expressed as a ratio (`height = line-height / font-size`)
/// so Flutter scales it correctly at any size.
class AppTypography {
  const AppTypography({
    required this.textXSmall,
    required this.textSmall,
    required this.textBase,
    required this.textLarge,
    required this.textXLarge,
    required this.text2XLarge,
    required this.text3XLarge,
    required this.textDisplay,
    required this.textDisplayLarge,
    required this.textDisplayXLarge,
  });

  /// 10 pt.
  final TextStyle textXSmall;

  /// 12 pt.
  final TextStyle textSmall;

  /// 14 pt. — base body size.
  final TextStyle textBase;

  /// 16 pt.
  final TextStyle textLarge;

  /// 18 pt.
  final TextStyle textXLarge;

  /// 20 pt.
  final TextStyle text2XLarge;

  /// 24 pt.
  final TextStyle text3XLarge;

  /// 30 pt.
  final TextStyle textDisplay;

  /// 36 pt.
  final TextStyle textDisplayLarge;

  /// 48 pt.
  final TextStyle textDisplayXLarge;

  /// The font family used for all text styles.
  static const _fontFamily = FontFamily.ibmPlexSansThai;

  /// The default typography scale. Use this as the single source of truth for
  /// all text styles; override individual styles at the widget level only when
  /// strictly necessary.
  static const base = AppTypography(
    textXSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 14 / 10,
      letterSpacing: 0,
    ),
    textSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 16 / 12,
      letterSpacing: 0,
    ),
    textBase: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 20 / 14,
      letterSpacing: -0.006,
    ),
    textLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: -0.011,
    ),
    textXLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 28 / 18,
      letterSpacing: -0.015,
    ),
    text2XLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 28 / 20,
      letterSpacing: -0.015,
    ),
    text3XLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      height: 32 / 24,
      letterSpacing: -0.02,
    ),
    textDisplay: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 30,
      fontWeight: FontWeight.w400,
      height: 36 / 30,
      letterSpacing: -0.02,
    ),
    textDisplayLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 36,
      fontWeight: FontWeight.w400,
      height: 44 / 36,
      letterSpacing: -0.02,
    ),
    textDisplayXLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 48,
      fontWeight: FontWeight.w400,
      height: 56 / 48,
      letterSpacing: -0.02,
    ),
  );

  /// Returns a copy of [base] with every [TextStyle.fontSize] scaled by
  /// [ScreenUtil] (`.sp`). Call this only after `ScreenUtil.init()` has run.
  static AppTypography scaled() => AppTypography(
    textXSmall: base.textXSmall.copyWith(fontSize: base.textXSmall.fontSize!.sp),
    textSmall: base.textSmall.copyWith(fontSize: base.textSmall.fontSize!.sp),
    textBase: base.textBase.copyWith(fontSize: base.textBase.fontSize!.sp),
    textLarge: base.textLarge.copyWith(fontSize: base.textLarge.fontSize!.sp),
    textXLarge: base.textXLarge.copyWith(fontSize: base.textXLarge.fontSize!.sp),
    text2XLarge: base.text2XLarge.copyWith(fontSize: base.text2XLarge.fontSize!.sp),
    text3XLarge: base.text3XLarge.copyWith(fontSize: base.text3XLarge.fontSize!.sp),
    textDisplay: base.textDisplay.copyWith(fontSize: base.textDisplay.fontSize!.sp),
    textDisplayLarge: base.textDisplayLarge.copyWith(fontSize: base.textDisplayLarge.fontSize!.sp),
    textDisplayXLarge: base.textDisplayXLarge.copyWith(fontSize: base.textDisplayXLarge.fontSize!.sp),
  );
}
