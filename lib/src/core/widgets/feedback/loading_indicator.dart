import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:remixicon/remixicon.dart';

class AppLoadingIndicator extends HookWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 1))..repeat();

    return Center(
      child: RotationTransition(
        turns: controller,
        child: Icon(RemixIcons.loader_2_fill, color: context.colors.textSoft400),
      ),
    );
  }
}
