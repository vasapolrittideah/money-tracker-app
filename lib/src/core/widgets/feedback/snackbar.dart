import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:remixicon/remixicon.dart';

enum SnackbarType { success, error, info }

class AppSnackbar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
    BuildContext context,
    String message, {
    SnackbarType type = SnackbarType.info,
  }) {
    final Color effectiveBackgroundColor = switch (type) {
      SnackbarType.success => context.colors.successLight,
      SnackbarType.error => context.colors.errorLight,
      SnackbarType.info => context.colors.infoLight,
    };

    final Color effectiveTextColor = switch (type) {
      SnackbarType.success => context.colors.successDark,
      SnackbarType.error => context.colors.errorDark,
      SnackbarType.info => context.colors.infoDark,
    };

    final effectiveIcon = switch (type) {
      SnackbarType.success => RemixIcons.check_fill,
      SnackbarType.error => RemixIcons.error_warning_fill,
      SnackbarType.info => RemixIcons.information_fill,
    };

    final Widget snackbarContent = Padding(
      padding: EdgeInsets.only(top: context.dimensions.dim1.h, bottom: context.dimensions.dim3.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(effectiveIcon, color: effectiveTextColor, size: context.dimensions.dim5.r),
          SizedBox(width: context.dimensions.dim2.w),
          Expanded(
            child: Text(message, style: context.typography.textBase.copyWith(color: effectiveTextColor)),
          ),
        ],
      ),
    );

    final messenger = ScaffoldMessenger.of(context);
    messenger.removeCurrentSnackBar();
    return messenger.showSnackBar(SnackBar(backgroundColor: effectiveBackgroundColor, content: snackbarContent));
  }
}
