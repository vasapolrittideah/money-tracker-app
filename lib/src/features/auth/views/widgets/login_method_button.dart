import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracker/src/core/extensions/string_extension.dart';
import 'package:money_tracker/src/core/gen/assets.gen.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/buttons/button.dart';

enum SocialPlatform { apple, google, facebook, line }

class LoginMethodButton extends StatelessWidget {
  const LoginMethodButton({super.key, this.platform, this.customMethod, required this.onPressed, this.disabled = false})
    : assert(platform != null || customMethod != null, 'Either platform or customMethod must be provided'),
      assert(platform == null || customMethod == null, 'platform and customMethod cannot be provided at the same time');

  final SocialPlatform? platform;
  final ({String name, Icon icon})? customMethod;
  final VoidCallback onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = switch (platform) {
      SocialPlatform.apple => Colors.black,
      SocialPlatform.google => Colors.white,
      SocialPlatform.facebook => Color(0xFF1877F2),
      SocialPlatform.line => Color(0xFF06C755),
      null => Colors.transparent,
    };

    final effectiveIcon = switch (platform) {
      SocialPlatform.apple => Assets.images.apple.svg(color: Colors.white),
      SocialPlatform.google => Assets.images.google.svg(color: disabled ? context.colors.textSoft400 : null),
      SocialPlatform.facebook => Assets.images.facebook.svg(
        color: disabled ? context.colors.textSoft400 : context.colors.textWhite0,
      ),
      SocialPlatform.line => Assets.images.line.svg(
        color: disabled ? context.colors.textSoft400 : null,
        width: context.dimensions.dim4_5.r,
      ),
      null => customMethod?.icon,
    };

    final effectiveButtonVariant = switch (platform) {
      SocialPlatform.apple => ButtonVariant.primary,
      SocialPlatform.google => ButtonVariant.outlined,
      SocialPlatform.facebook => ButtonVariant.primary,
      SocialPlatform.line => ButtonVariant.primary,
      null => ButtonVariant.outlined,
    };

    final effectiveText = switch (null) {
      _ when platform != null => 'ดำเนินการต่อด้วย ${platform!.name.toCapitalized()}',
      _ when customMethod != null => 'เข้าสู่ระบบด้วย${customMethod!.name.toCapitalized()}',
      _ => '',
    };

    return AppButton(
      text: effectiveText,
      prefixIcon: effectiveIcon,
      backgroundColor: effectiveBackgroundColor,
      variant: effectiveButtonVariant,
      disabled: disabled,
      onPressed: onPressed,
    );
  }
}
