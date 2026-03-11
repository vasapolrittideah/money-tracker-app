import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/feedback/loading_indicator.dart';

enum ButtonVariant { primary, outlined, text }

enum ButtonSize { xsmall, small, medium }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.prefixIcon,
    this.loading = false,
    this.disabled = false,
    this.loadingText,
    this.backgroundColor,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.fullWidth = true,
    this.onPressed,
  });

  final String text;
  final bool loading;
  final bool disabled;
  final Widget? prefixIcon;
  final String? loadingText;
  final Color? backgroundColor;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool fullWidth;
  final VoidCallback? onPressed;

  bool get _isInactive => loading || disabled;

  @override
  Widget build(BuildContext context) {
    final Color effectiveBackgroundColor = _isInactive
        ? variant == ButtonVariant.text
              ? Colors.transparent
              : context.colors.bgSub200
        : backgroundColor ??
              switch (variant) {
                ButtonVariant.primary => context.colors.primaryBase,
                ButtonVariant.outlined => Colors.transparent,
                ButtonVariant.text => Colors.transparent,
              };

    final Color effectiveTextColor = _isInactive
        ? context.colors.textSoft400
        : switch (variant) {
            ButtonVariant.primary => Colors.white,
            ButtonVariant.outlined => context.colors.textStrong950,
            ButtonVariant.text => context.colors.textStrong950,
          };

    final Color effectiveBorderColor = _isInactive
        ? Colors.transparent
        : switch (variant) {
            ButtonVariant.primary => Colors.transparent,
            ButtonVariant.outlined => context.colors.borderSub300,
            ButtonVariant.text => Colors.transparent,
          };

    final double? effectiveHeight = switch (size) {
      _ when variant == ButtonVariant.text => null,
      ButtonSize.xsmall => context.dimensions.dim8.h,
      ButtonSize.small => context.dimensions.dim10.h,
      ButtonSize.medium => context.dimensions.dim12.h,
    };

    final String effectiveText = loading ? (loadingText ?? text) : text;

    final button = GestureDetector(
      onTap: _isInactive ? null : onPressed,
      child: Container(
        height: effectiveHeight,
        padding: EdgeInsets.symmetric(horizontal: variant == ButtonVariant.text ? 0 : context.dimensions.dim4.w),
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: context.borders.radiusMdAll,
          border: Border.all(color: effectiveBorderColor),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (loading) ...[AppLoadingIndicator(), SizedBox(width: context.dimensions.dim2.w)],
              if (prefixIcon != null && !loading) ...[prefixIcon!, SizedBox(width: context.dimensions.dim2.w)],
              Text(
                effectiveText,
                style: context.typography.textBase.copyWith(color: effectiveTextColor, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );

    return fullWidth ? button : IntrinsicWidth(child: button);
  }
}
