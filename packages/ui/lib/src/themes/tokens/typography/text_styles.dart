import 'package:shared/libs.dart';
import 'package:ui/generated/fonts.gen.dart';
import 'package:flutter/material.dart';

final class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.base,
    required this.t8,
    required this.t10,
    required this.t12,
    required this.t14,
    required this.t16,
    required this.t18,
    required this.t20,
    required this.t24,
    required this.t28,
    required this.t32,
  });

  final TextStyle base; // 14
  final TextStyle t8;
  final TextStyle t10;
  final TextStyle t12;
  final TextStyle t14;
  final TextStyle t16;
  final TextStyle t18;
  final TextStyle t20;
  final TextStyle t24;
  final TextStyle t28;
  final TextStyle t32;

  static const _regular = FontWeight.w400;
  static const _regularVariant = [FontVariation('wght', 400)];
  static const _medium = FontWeight.w500;
  static const _mediumVariant = [FontVariation('wght', 500)];
  static const _semiBold = FontWeight.w600;
  static const _semiBoldVariant = [FontVariation('wght', 600)];
  static const _bold = FontWeight.w700;
  static const _boldVariant = [FontVariation('wght', 700)];
  static const _fontFamily = FontFamily.ibmPlexSansThai;

  static regular(Color defaultColor) => AppTextStyles(
    base: TextStyle(
      fontSize: 14.sp,
      fontWeight: _regular,
      fontVariations: _regularVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t8: TextStyle(
      fontSize: 8.sp,
      fontWeight: _regular,
      fontVariations: _regularVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t10: TextStyle(
      fontSize: 10.sp,
      fontWeight: _regular,
      fontVariations: _regularVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t12: TextStyle(
      fontSize: 12.sp,
      fontWeight: _regular,
      fontVariations: _regularVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t14: TextStyle(
      fontSize: 14.sp,
      fontWeight: _regular,
      fontVariations: _regularVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t16: TextStyle(
      fontSize: 16.sp,
      fontWeight: _regular,
      fontVariations: _regularVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t18: TextStyle(
      fontSize: 18.sp,
      fontWeight: _regular,
      fontVariations: _regularVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t20: TextStyle(
      fontSize: 20.sp,
      fontWeight: _regular,
      fontVariations: _regularVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t24: TextStyle(
      fontSize: 24.sp,
      fontWeight: _regular,
      fontVariations: _regularVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t28: TextStyle(
      fontSize: 28.sp,
      fontWeight: _regular,
      fontVariations: _regularVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t32: TextStyle(
      fontSize: 32.sp,
      fontWeight: _regular,
      fontVariations: _regularVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
  );

  static medium(Color defaultColor) => AppTextStyles(
    base: TextStyle(
      fontSize: 14.sp,
      fontWeight: _medium,
      fontVariations: _mediumVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t8: TextStyle(
      fontSize: 8.sp,
      fontWeight: _medium,
      fontVariations: _mediumVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t10: TextStyle(
      fontSize: 10.sp,
      fontWeight: _medium,
      fontVariations: _mediumVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t12: TextStyle(
      fontSize: 12.sp,
      fontWeight: _medium,
      fontVariations: _mediumVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t14: TextStyle(
      fontSize: 14.sp,
      fontWeight: _medium,
      fontVariations: _mediumVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t16: TextStyle(
      fontSize: 16.sp,
      fontWeight: _medium,
      fontVariations: _mediumVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t18: TextStyle(
      fontSize: 18.sp,
      fontWeight: _medium,
      fontVariations: _mediumVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t20: TextStyle(
      fontSize: 20.sp,
      fontWeight: _medium,
      fontVariations: _mediumVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t24: TextStyle(
      fontSize: 24.sp,
      fontWeight: _medium,
      fontVariations: _mediumVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t28: TextStyle(
      fontSize: 28.sp,
      fontWeight: _medium,
      fontVariations: _mediumVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t32: TextStyle(
      fontSize: 32.sp,
      fontWeight: _medium,
      fontVariations: _mediumVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
  );

  static semiBold(Color defaultColor) => AppTextStyles(
    base: TextStyle(
      fontSize: 14.sp,
      fontWeight: _semiBold,
      fontVariations: _semiBoldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t8: TextStyle(
      fontSize: 8.sp,
      fontWeight: _semiBold,
      fontVariations: _semiBoldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t10: TextStyle(
      fontSize: 10.sp,
      fontWeight: _semiBold,
      fontVariations: _semiBoldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t12: TextStyle(
      fontSize: 12.sp,
      fontWeight: _semiBold,
      fontVariations: _semiBoldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t14: TextStyle(
      fontSize: 14.sp,
      fontWeight: _semiBold,
      fontVariations: _semiBoldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t16: TextStyle(
      fontSize: 16.sp,
      fontWeight: _semiBold,
      fontVariations: _semiBoldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t18: TextStyle(
      fontSize: 18.sp,
      fontWeight: _semiBold,
      fontVariations: _semiBoldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t20: TextStyle(
      fontSize: 20.sp,
      fontWeight: _semiBold,
      fontVariations: _semiBoldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t24: TextStyle(
      fontSize: 24.sp,
      fontWeight: _semiBold,
      fontVariations: _semiBoldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t28: TextStyle(
      fontSize: 28.sp,
      fontWeight: _semiBold,
      fontVariations: _semiBoldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t32: TextStyle(
      fontSize: 32.sp,
      fontWeight: _semiBold,
      fontVariations: _semiBoldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
  );

  static bold(Color defaultColor) => AppTextStyles(
    base: TextStyle(
      fontSize: 14.sp,
      fontWeight: _bold,
      fontVariations: _boldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t8: TextStyle(
      fontSize: 8.sp,
      fontWeight: _bold,
      fontVariations: _boldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t10: TextStyle(
      fontSize: 10.sp,
      fontWeight: _bold,
      fontVariations: _boldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t12: TextStyle(
      fontSize: 12.sp,
      fontWeight: _bold,
      fontVariations: _boldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t14: TextStyle(
      fontSize: 14.sp,
      fontWeight: _bold,
      fontVariations: _boldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t16: TextStyle(
      fontSize: 16.sp,
      fontWeight: _bold,
      fontVariations: _boldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t18: TextStyle(
      fontSize: 18.sp,
      fontWeight: _bold,
      fontVariations: _boldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t20: TextStyle(
      fontSize: 20.sp,
      fontWeight: _bold,
      fontVariations: _boldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t24: TextStyle(
      fontSize: 24.sp,
      fontWeight: _bold,
      fontVariations: _boldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t28: TextStyle(
      fontSize: 28.sp,
      fontWeight: _bold,
      fontVariations: _boldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
    t32: TextStyle(
      fontSize: 32.sp,
      fontWeight: _bold,
      fontVariations: _boldVariant,
      fontFamily: _fontFamily,
      letterSpacing: 0,
      color: defaultColor,
    ),
  );

  @override
  AppTextStyles copyWith({
    TextStyle? base,
    TextStyle? t8,
    TextStyle? t10,
    TextStyle? t12,
    TextStyle? t14,
    TextStyle? t16,
    TextStyle? t18,
    TextStyle? t20,
    TextStyle? t24,
    TextStyle? t28,
    TextStyle? t32,
  }) {
    return AppTextStyles(
      base: base ?? this.base,
      t8: t8 ?? this.t8,
      t10: t10 ?? this.t10,
      t12: t12 ?? this.t12,
      t14: t14 ?? this.t14,
      t16: t16 ?? this.t16,
      t18: t18 ?? this.t18,
      t20: t20 ?? this.t20,
      t24: t24 ?? this.t24,
      t28: t28 ?? this.t28,
      t32: t32 ?? this.t32,
    );
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) {
      return this;
    }
    return AppTextStyles(
      base: TextStyle.lerp(base, other.base, t)!,
      t8: TextStyle.lerp(t8, other.t8, t)!,
      t10: TextStyle.lerp(t10, other.t10, t)!,
      t12: TextStyle.lerp(t12, other.t12, t)!,
      t14: TextStyle.lerp(t14, other.t14, t)!,
      t16: TextStyle.lerp(t16, other.t16, t)!,
      t18: TextStyle.lerp(t18, other.t18, t)!,
      t20: TextStyle.lerp(t20, other.t20, t)!,
      t24: TextStyle.lerp(t24, other.t24, t)!,
      t28: TextStyle.lerp(t28, other.t28, t)!,
      t32: TextStyle.lerp(t32, other.t32, t)!,
    );
  }
}
