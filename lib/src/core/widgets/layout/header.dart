import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:remixicon/remixicon.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({
    super.key,
    this.title,
    this.actions,
    this.goBackButton = true,
    this.closeButton = false,
    this.backgroundColor,
  });

  final String? title;
  final List<Widget>? actions;
  final bool goBackButton;
  final bool closeButton;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? context.colors.bgWhite0,
      child: SafeArea(
        child: Container(
          height: preferredSize.height,
          padding: EdgeInsets.symmetric(horizontal: context.dimensions.dim4.w),
          child: Row(
            children: [
              if (goBackButton) ...[
                GestureDetector(
                  onTap: () {
                    if (context.canPop()) context.pop();
                  },
                  child: Icon(RemixIcons.arrow_left_line),
                ),
                SizedBox(width: context.dimensions.dim4.w),
              ],
              if (title != null)
                Text(
                  title!,
                  style: context.typography.textXLarge.copyWith(
                    color: context.colors.textStrong950,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (actions != null) ...actions!,
              if (closeButton) ...[
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (context.canPop()) context.pop();
                  },
                  child: Icon(RemixIcons.close_line),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
