import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared/libs.dart';

final class AppBorders extends ThemeExtension<AppBorders> {
  const AppBorders({
    required this.r2,
    required this.r4,
    required this.r8,
    required this.r12,
    required this.r16,
    required this.full,
    required this.width,
  });
  static final borders = AppBorders(
    r2: 2.0.r,
    r4: 4.0.r,
    r8: 8.0.r,
    r12: 12.0.r,
    r16: 16.0.r,
    full: 999.0.r,
    width: 1.0.r,
  );

  final double r2;
  final double r4;
  final double r8;
  final double r12;
  final double r16;
  final double full;
  final double width;

  @override
  AppBorders copyWith({double? r2, double? r4, double? r8, double? r12, double? r16, double? full, double? width}) {
    return AppBorders(
      r2: r2 ?? this.r2,
      r4: r4 ?? this.r4,
      r8: r8 ?? this.r8,
      r12: r12 ?? this.r12,
      r16: r16 ?? this.r16,
      full: full ?? this.full,
      width: width ?? this.width,
    );
  }

  @override
  AppBorders lerp(ThemeExtension<AppBorders>? other, double t) {
    if (other is! AppBorders) {
      return this;
    }

    return AppBorders(
      r2: lerpDouble(r2, other.r2, t)!,
      r4: lerpDouble(r4, other.r4, t)!,
      r8: lerpDouble(r8, other.r8, t)!,
      r12: lerpDouble(r12, other.r12, t)!,
      r16: lerpDouble(r16, other.r16, t)!,
      full: lerpDouble(full, other.full, t)!,
      width: lerpDouble(width, other.width, t)!,
    );
  }
}
