import 'package:moneytracker/src/app_module.dart';
import 'package:moneytracker/src/view/app_router.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      ensureScreenSize: true,
      designSize: const Size(360, 690),
      builder: (context, child) => EasyLocalization(
        path: AppModule.translationsAssets[0],
        supportedLocales: [Locale('th'), Locale('en')],
        fallbackLocale: Locale('th'),
        startLocale: Locale('th'),
        assetLoader: MultiPackageAssetLoader(AppModule.translationsAssets),
        saveLocale: false,
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerDelegate: AppRouter.router.routerDelegate,
              routeInformationParser: AppRouter.router.routeInformationParser,
              routeInformationProvider: AppRouter.router.routeInformationProvider,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: ThemeData.light().copyWith(
                scaffoldBackgroundColor: Colors.transparent,
                extensions: <ThemeExtension<dynamic>>[AppThemes(tokens: AppTokens.light)],
              ),
              builder: (context, child) => child!,
            );
          },
        ),
      ),
    );
  }
}
