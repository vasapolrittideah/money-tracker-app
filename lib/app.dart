import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracker/src/app_router.dart';
import 'package:money_tracker/src/core/theme/theme.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';

class MoneyTrackerApp extends StatelessWidget {
  MoneyTrackerApp({super.key});

  final AppTheme _theme = AppTheme.light;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      ensureScreenSize: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AppThemeProvider(
          theme: _theme,
          child: MaterialApp.router(
            key: const Key('MoneyTrackerApp'),
            debugShowCheckedModeBanner: false,
            routerDelegate: AppRouter.router.routerDelegate,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            theme: ThemeData(scaffoldBackgroundColor: Colors.transparent, splashFactory: NoSplash.splashFactory),
            builder: (context, child) => child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
