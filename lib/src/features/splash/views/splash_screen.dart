import 'package:flutter/material.dart';
import 'package:money_tracker/src/core/gen/assets.gen.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/feedback/loading_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgWhite0,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Assets.images.logo.svg(width: context.dimensions.dim24, color: context.colors.primaryBase),
            ),
            Positioned(bottom: context.dimensions.dim10, left: 0, right: 0, child: AppLoadingIndicator()),
          ],
        ),
      ),
    );
  }
}
