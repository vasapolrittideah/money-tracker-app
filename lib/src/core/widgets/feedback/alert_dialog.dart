import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/buttons/button.dart';
import 'package:remixicon/remixicon.dart';

enum AlertDialogType { success, error }

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    super.key,
    required this.title,
    required this.message,
    this.buttonText,
    this.onButtonPressed,
    this.type = AlertDialogType.error,
  });

  final String title;
  final String message;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final AlertDialogType type;

  @override
  Widget build(BuildContext context) {
    final Color effectiveBackgroundColor = switch (type) {
      AlertDialogType.success => context.colors.successLight,
      AlertDialogType.error => context.colors.errorLight,
    };

    final Color effectiveTextColor = switch (type) {
      AlertDialogType.success => context.colors.successDark,
      AlertDialogType.error => context.colors.errorDark,
    };

    return Dialog(
      backgroundColor: effectiveBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: context.borders.radiusLgAll),
      child: Padding(
        padding: EdgeInsets.all(context.dimensions.dim4.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(RemixIcons.error_warning_fill, size: context.dimensions.dim6.w, color: effectiveTextColor),
            SizedBox(height: context.dimensions.dim4.h),
            Text(
              title,
              style: context.typography.text3XLarge.copyWith(color: effectiveTextColor, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.dimensions.dim4.h),
            Text(
              message,
              style: context.typography.textBase.copyWith(color: effectiveTextColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.dimensions.dim6.h),
            AppButton(
              text: buttonText ?? 'ตกลง',
              backgroundColor: effectiveTextColor,
              textColor: effectiveBackgroundColor,
              size: ButtonSize.small,
              onPressed: () {
                onButtonPressed?.call();
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
