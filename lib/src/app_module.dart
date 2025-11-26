import 'package:shared/shared.dart';

class AppModule {
  AppModule._();

  static final List<BaseModule> _packages = [SharedModule()];

  static void init() {
    for (var module in _packages) {
      module.initialize();
    }
  }

  static List<String> get translationsAssets {
    final List<String> assets = ['assets/translations'];

    for (var module in _packages) {
      assets.add('packages/${module.name}/assets/translations');
    }

    return assets;
  }
}
