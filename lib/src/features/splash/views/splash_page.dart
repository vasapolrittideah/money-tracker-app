import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/src/app_router.dart';
import 'package:money_tracker/src/core/gen/assets.gen.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/feedback/loading_indicator.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () {
        if (context.mounted) context.go(AppRouter.selectLoginMethod);
      });

      return null;
    }, const []);

    return Scaffold(
      backgroundColor: context.colors.bgWhite0,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Assets.images.logo.svg(width: context.dimensions.dim24.w, color: context.colors.primaryBase),
            ),
            Positioned(bottom: context.dimensions.dim10, left: 0, right: 0, child: AppLoadingIndicator()),
          ],
        ),
      ),
    );
  }
}
