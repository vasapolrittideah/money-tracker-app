import 'package:flutter/material.dart';
import 'package:shared/libs.dart';

final class AppShadows extends ThemeExtension<AppShadows> {
  const AppShadows({required this.s1, this.s2});

  final List<BoxShadow> s1;
  final List<BoxShadow>? s2;

  static final light = AppShadows(
    s1: [BoxShadow(color: Color.fromRGBO(10, 13, 20, 0.04), blurRadius: 2.r, spreadRadius: 0, offset: Offset(0, 1.h))],
    s2: [
      BoxShadow(
        color: Color.fromRGBO(14, 18, 27, 0.10),
        blurRadius: 32.r,
        spreadRadius: -12.r,
        offset: Offset(0, 16.h),
      ),
    ],
  );

  @override
  AppShadows copyWith({List<BoxShadow>? s1, List<BoxShadow>? s2}) {
    return AppShadows(s1: s1 ?? this.s1, s2: s2 ?? this.s2);
  }

  @override
  AppShadows lerp(ThemeExtension<AppShadows>? other, double t) {
    if (other is! AppShadows) {
      return this;
    }
    return AppShadows(s1: BoxShadow.lerpList(s1, other.s1, t)!, s2: BoxShadow.lerpList(s2, other.s2, t));
  }
}
