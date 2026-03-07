import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';

class AppBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    double heightFactor = 0.5,
    bool fullScreen = false,
    Color? backgroundColor,
    Clip? clipBehavior,
    BoxConstraints? constraints,
  }) {
    Navigator.of(context).popUntil((route) => route is PageRoute);

    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: backgroundColor ?? context.colors.bgWhite0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(context.borders.radiusLg)),
      ),
      clipBehavior: clipBehavior ?? Clip.antiAliasWithSaveLayer,
      constraints:
          constraints ??
          BoxConstraints(
            maxHeight:
                MediaQuery.of(context).size.height * (fullScreen ? 1.0 : heightFactor) -
                MediaQuery.of(context).padding.top,
          ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(top: context.dimensions.dim2.h),
        child: Column(
          children: [
            Container(
              width: context.dimensions.dim8.w,
              height: context.dimensions.dim1.h,
              decoration: BoxDecoration(color: context.colors.borderSub300, borderRadius: BorderRadius.circular(999)),
            ),
            SizedBox(height: context.dimensions.dim2.h),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
