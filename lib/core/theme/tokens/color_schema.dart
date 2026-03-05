// ignore_for_file: unused_field

import 'package:flutter/material.dart';

/// Internal raw color palette — all primitive color values used across the app.
/// This class is private and should never be referenced directly from UI code.
/// Use [AppColorSchema] semantic tokens instead.
class _AppColorPalette {
  const _AppColorPalette._();

  // Gray
  static const gray0 = Color(0xFFFFFFFF);
  static const gray50 = Color(0xFFF7F7F7);
  static const gray100 = Color(0xFFF5F5F5);
  static const gray200 = Color(0xFFEBEBEB);
  static const gray300 = Color(0xFFD1D1D1);
  static const gray400 = Color(0xFFA3A3A3);
  static const gray500 = Color(0xFF7B7B7B);
  static const gray600 = Color(0xFF5C5C5C);
  static const gray700 = Color(0xFF333333);
  static const gray800 = Color(0xFF292929);
  static const gray900 = Color(0xFF262626);
  static const gray950 = Color(0xFF171717);
  static const grayAlpha24 = Color(0x3DA3A3A3);
  static const grayAlpha16 = Color(0x29A3A3A3);
  static const grayAlpha10 = Color(0x1AA3A3A3);

  // Blue
  static const blue50 = Color(0xFFEBF1FF);
  static const blue100 = Color(0xFFD5E2FF);
  static const blue200 = Color(0xFFC0D5FF);
  static const blue300 = Color(0xFF97BAFF);
  static const blue400 = Color(0xFF6895FF);
  static const blue500 = Color(0xFF335CFF);
  static const blue600 = Color(0xFF3559E9);
  static const blue700 = Color(0xFF2547D0);
  static const blue800 = Color(0xFF1F3BAD);
  static const blue900 = Color(0xFF182F8B);
  static const blue950 = Color(0xFF122368);
  static const blueAlpha24 = Color(0x3D476CFF);
  static const blueAlpha16 = Color(0x29476CFF);
  static const blueAlpha10 = Color(0x1A476CFF);

  // Orange
  static const orange50 = Color(0xFFFFF3EB);
  static const orange100 = Color(0xFFFFE6D5);
  static const orange200 = Color(0xFFFFD9C0);
  static const orange300 = Color(0xFFFFC197);
  static const orange400 = Color(0xFFFFA468);
  static const orange500 = Color(0xFFFA7319);
  static const orange600 = Color(0xFFE16614);
  static const orange700 = Color(0xFFCE5E12);
  static const orange800 = Color(0xFFB75310);
  static const orange900 = Color(0xFF96440D);
  static const orange950 = Color(0xFF71330A);
  static const orangeAlpha24 = Color(0x3DFF9147);
  static const orangeAlpha16 = Color(0x29FF9147);
  static const orangeAlpha10 = Color(0x1AFF9147);

  // Red
  static const red50 = Color(0xFFFFEBEC);
  static const red100 = Color(0xFFFFD5D8);
  static const red200 = Color(0xFFFFC0C5);
  static const red300 = Color(0xFFFF97A0);
  static const red400 = Color(0xFFFF6875);
  static const red500 = Color(0xFFFB3748);
  static const red600 = Color(0xFFE93544);
  static const red700 = Color(0xFFD02533);
  static const red800 = Color(0xFFAD1F2B);
  static const red900 = Color(0xFF8B1822);
  static const red950 = Color(0xFF681219);
  static const redAlpha24 = Color(0x3DFB3748);
  static const redAlpha16 = Color(0x29FB3748);
  static const redAlpha10 = Color(0x1AFB3748);

  // Green
  static const green50 = Color(0xFFE0FAEC);
  static const green100 = Color(0xFFD0FBE9);
  static const green200 = Color(0xFFC2F5DA);
  static const green300 = Color(0xFF84EBB4);
  static const green400 = Color(0xFF3EE089);
  static const green500 = Color(0xFF1FC16B);
  static const green600 = Color(0xFF1DAF61);
  static const green700 = Color(0xFF178C4E);
  static const green800 = Color(0xFF1A7544);
  static const green900 = Color(0xFF16643B);
  static const green950 = Color(0xFF0B4627);
  static const greenAlpha24 = Color(0x3D1FC16B);
  static const greenAlpha16 = Color(0x291FC16B);
  static const greenAlpha10 = Color(0x1A1FC16B);

  // Yellow
  static const yellow50 = Color(0xFFFFF4D6);
  static const yellow100 = Color(0xFFFFEFCC);
  static const yellow200 = Color(0xFFFFECC0);
  static const yellow300 = Color(0xFFFFE097);
  static const yellow400 = Color(0xFFFFD268);
  static const yellow500 = Color(0xFFF6B51E);
  static const yellow600 = Color(0xFFE6A819);
  static const yellow700 = Color(0xFFC99A2C);
  static const yellow800 = Color(0xFFA78025);
  static const yellow900 = Color(0xFF86661D);
  static const yellow950 = Color(0xFF624C18);
  static const yellowAlpha24 = Color(0x3DFBC64B);
  static const yellowAlpha16 = Color(0x29FBC64B);
  static const yellowAlpha10 = Color(0x1AFBC64B);

  // Purple
  static const purple50 = Color(0xFFEFEBFF);
  static const purple100 = Color(0xFFDCD5FF);
  static const purple200 = Color(0xFFCAC0FF);
  static const purple300 = Color(0xFFA897FF);
  static const purple400 = Color(0xFF8C71F6);
  static const purple500 = Color(0xFF7D52F4);
  static const purple600 = Color(0xFF693EE0);
  static const purple700 = Color(0xFF5B2CC9);
  static const purple800 = Color(0xFF4C25A7);
  static const purple900 = Color(0xFF3D1D86);
  static const purple950 = Color(0xFF351A75);
  static const purpleAlpha24 = Color(0x3D784DEF);
  static const purpleAlpha16 = Color(0x29784DEF);
  static const purpleAlpha10 = Color(0x1A784DEF);

  // Static
  static const white = Colors.white;
  static const black = Colors.black;
}

/// Semantic color tokens mapped to their purpose in the UI.
/// Consumers should always use these tokens rather than raw colors so that
/// switching themes (e.g. dark mode) only requires swapping the [AppColorSchema]
/// instance without touching any widget code.
class AppColorSchema {
  AppColorSchema({
    // Text
    required this.textStrong950,
    required this.textSub600,
    required this.textSoft400,
    required this.textDisabled300,
    required this.textWhite0,

    // Background
    required this.bgStrong950,
    required this.bgSurface800,
    required this.bgSub300,
    required this.bgSub200,
    required this.bgWeak50,
    required this.bgWeak25,
    required this.bgWhite0,

    // Border
    required this.borderStrong950,
    required this.borderSub300,
    required this.borderSoft200,
    required this.borderWhite0,

    // Primary
    required this.primaryDark,
    required this.primaryDarker,
    required this.primaryBase,

    // Faded
    required this.fadedDark,
    required this.fadedBase,
    required this.fadedLight,
    required this.fadedLighter,

    // Information
    required this.infoDark,
    required this.infoBase,
    required this.infoLight,
    required this.infoLighter,

    // Warning
    required this.warningDark,
    required this.warningBase,
    required this.warningLight,
    required this.warningLighter,

    // Error
    required this.errorDark,
    required this.errorBase,
    required this.errorLight,
    required this.errorLighter,

    // Success
    required this.successDark,
    required this.successBase,
    required this.successLight,
    required this.successLighter,
  });

  // Text
  final Color textStrong950;
  final Color textSub600;
  final Color textSoft400;
  final Color textDisabled300;
  final Color textWhite0;

  // Background
  final Color bgStrong950;
  final Color bgSurface800;
  final Color bgSub300;
  final Color bgSub200;
  final Color bgWeak50;
  final Color bgWeak25;
  final Color bgWhite0;

  // Border
  final Color borderStrong950;
  final Color borderSub300;
  final Color borderSoft200;
  final Color borderWhite0;

  // Primary
  final Color primaryDark;
  final Color primaryDarker;
  final Color primaryBase;

  // Faded
  final Color fadedDark;
  final Color fadedBase;
  final Color fadedLight;
  final Color fadedLighter;

  // Information
  final Color infoDark;
  final Color infoBase;
  final Color infoLight;
  final Color infoLighter;

  // Warning
  final Color warningDark;
  final Color warningBase;
  final Color warningLight;
  final Color warningLighter;

  // Error
  final Color errorDark;
  final Color errorBase;
  final Color errorLight;
  final Color errorLighter;

  // Success
  final Color successDark;
  final Color successBase;
  final Color successLight;
  final Color successLighter;

  /// The default light-mode color schema.
  /// Maps each semantic token to its corresponding primitive palette color.
  static final light = AppColorSchema(
    // Text
    textStrong950: _AppColorPalette.gray950,
    textSub600: _AppColorPalette.gray600,
    textSoft400: _AppColorPalette.gray400,
    textDisabled300: _AppColorPalette.gray300,
    textWhite0: _AppColorPalette.white,

    // Background
    bgStrong950: _AppColorPalette.gray950,
    bgSurface800: _AppColorPalette.gray800,
    bgSub300: _AppColorPalette.gray300,
    bgSub200: _AppColorPalette.gray200,
    bgWeak50: _AppColorPalette.gray50,
    bgWeak25: Color(0xFFF7F7F7),
    bgWhite0: _AppColorPalette.white,

    // Border
    borderStrong950: _AppColorPalette.gray950,
    borderSub300: _AppColorPalette.gray300,
    borderSoft200: _AppColorPalette.gray200,
    borderWhite0: _AppColorPalette.white,

    // Primary
    primaryDark: _AppColorPalette.purple800,
    primaryDarker: _AppColorPalette.purple700,
    primaryBase: _AppColorPalette.purple500,

    // Faded
    fadedDark: _AppColorPalette.gray800,
    fadedBase: _AppColorPalette.gray500,
    fadedLight: _AppColorPalette.gray200,
    fadedLighter: _AppColorPalette.gray100,

    // Information
    infoDark: _AppColorPalette.purple950,
    infoBase: _AppColorPalette.purple500,
    infoLight: _AppColorPalette.purple200,
    infoLighter: _AppColorPalette.purple50,

    // Warning
    warningDark: _AppColorPalette.orange950,
    warningBase: _AppColorPalette.orange500,
    warningLight: _AppColorPalette.orange200,
    warningLighter: _AppColorPalette.orange50,

    // Error
    errorDark: _AppColorPalette.red950,
    errorBase: _AppColorPalette.red500,
    errorLight: _AppColorPalette.red200,
    errorLighter: _AppColorPalette.red50,

    // Success
    successDark: _AppColorPalette.green950,
    successBase: _AppColorPalette.green500,
    successLight: _AppColorPalette.green200,
    successLighter: _AppColorPalette.green50,
  );
}
