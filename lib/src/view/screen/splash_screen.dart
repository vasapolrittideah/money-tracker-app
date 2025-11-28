import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared/libs.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        Future.delayed(const Duration(seconds: 2), () async {
          if (context.mounted) {
            context.push(AuthRouteName.login);
          }
        });
      });

      return null;
    }, []);

    return Scaffold(
      backgroundColor: context.appColors.staticWhite,
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(UiAssets.images.brand, width: 65.w, height: 65.h),
              Positioned(top: 100.h, child: AppCircularProgress()),
            ],
          ),
        ),
      ),
    );
  }
}
