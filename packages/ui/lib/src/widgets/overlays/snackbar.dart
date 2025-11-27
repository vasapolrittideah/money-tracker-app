import 'package:shared/shared.dart';
import 'package:ui/src/themes/themes.dart';
import 'package:flutter/material.dart';

enum AppSnackBarType { infomation, success, failure }

class AppSnackBar {
  static void show(
    BuildContext context, {
    String? title,
    required String message,
    AppSnackBarType type = AppSnackBarType.infomation,
  }) {
    switch (type) {
      case AppSnackBarType.infomation:
        _AppSnackBarInner.show(
          context,
          title: title,
          message: message,
          iconData: FontAwesomeIcons.circleInfo,
          backgroundColor: context.appColors.primaryBase,
        );
        break;
      case AppSnackBarType.success:
        _AppSnackBarInner.show(
          context,
          title: title,
          message: message,
          iconData: FontAwesomeIcons.solidCircleCheck,
          backgroundColor: context.appColors.successBase,
          messageColor: context.appColors.successDark,
        );
        break;
      case AppSnackBarType.failure:
        _AppSnackBarInner.show(
          context,
          title: title,
          message: message,
          iconData: FontAwesomeIcons.circleExclamation,
          backgroundColor: context.appColors.errorBase,
          messageColor: context.appColors.errorDark,
        );
        break;
    }
  }
}

class _AppSnackBarInner {
  _AppSnackBarInner._();

  static void show(
    BuildContext context, {
    String? title,
    required String message,
    required IconData iconData,
    Color? backgroundColor,
    Color? messageColor,
  }) {
    backgroundColor ??= context.appColors.primaryBase;
    messageColor ??= context.appColors.staticWhite;

    final snackBar = SnackBar(
      padding: EdgeInsets.only(
        top: context.appSpacing.s24,
        left: context.appSpacing.s24,
        right: context.appSpacing.s24,
        bottom: context.appSpacing.s16,
      ),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: 3),
      content: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: context.appSpacing.s2),
              child: Icon(iconData, color: messageColor, size: context.appTypography.regular.base.fontSize),
            ),
            SizedBox(width: context.appSpacing.s8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null) Text(title, style: context.appTypography.bold.base.copyWith(color: messageColor)),
                  Text(message, style: context.appTypography.regular.base.copyWith(color: messageColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
