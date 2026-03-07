import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.text, this.padding});

  final String? text;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: Container(height: context.borders.widthThin, color: context.colors.borderSoft200),
          ),
          if (text != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.dimensions.dim2.w),
              child: Text(text!, style: context.typography.textSmall.copyWith(color: context.colors.textSoft400)),
            ),
          Expanded(
            child: Container(height: context.borders.widthThin, color: context.colors.borderSoft200),
          ),
        ],
      ),
    );
  }
}
