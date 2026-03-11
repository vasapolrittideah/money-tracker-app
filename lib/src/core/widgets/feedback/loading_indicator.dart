import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:remixicon/remixicon.dart';

class AppLoadingIndicator extends HookWidget {
  const AppLoadingIndicator({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 1))..repeat();

    final effectiveColor = color ?? context.colors.textSoft400;

    return RotationTransition(
      turns: controller,
      child: SizedBox.square(
        dimension: context.dimensions.dim6.r,
        child: Icon(RemixIcons.loader_2_fill, color: effectiveColor),
      ),
    );
  }
}
