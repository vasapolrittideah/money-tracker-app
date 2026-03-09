import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config.g.dart';

/// Build flavor of the app — automatically detected from the package name suffix.
enum Flavor { development, staging, production }

/// Provider for app configuration.
///
/// Has no real implementation — must be overridden in main.dart before the app starts:
/// ```dart
/// ProviderScope(
///   overrides: [appConfigProvider.overrideWithValue(config)],
/// )
/// ```
/// Uses `keepAlive: true` because config does not change during the app's lifetime
/// and other providers (e.g. `apiClient`) depend on this provider.
@Riverpod(keepAlive: true)
AppConfig appConfig(Ref ref) => throw UnimplementedError('appConfigProvider must be overridden in main');

/// App configuration that varies by build flavor.
class AppConfig {
  const AppConfig({required this.flavor, required this.apiUrl, required this.appName});

  final Flavor flavor;
  final String apiUrl;
  final String appName;

  /// Creates an [AppConfig] by detecting the flavor from the package name suffix.
  /// Call in `main.dart` before `runApp` to obtain a synchronous config.
  static Future<AppConfig> fromEnv() async {
    final packageInfo = await PackageInfo.fromPlatform();

    // Extract the last segment of the package name e.g. 'com.example.app.stg' → 'stg'
    final suffix = packageInfo.packageName.split('.').last.toLowerCase();

    return switch (suffix) {
      'prod' => const AppConfig(
        flavor: Flavor.production,
        apiUrl: 'http://localhost:5050/api/v1',
        appName: 'Money Tracker',
      ),
      'stg' => const AppConfig(
        flavor: Flavor.staging,
        apiUrl: 'http://localhost:5050/api/v1',
        appName: 'Money Tracker Stg',
      ),
      _ => const AppConfig(
        flavor: Flavor.development,
        apiUrl: 'http://localhost:5050/api/v1',
        appName: 'Money Tracker Dev',
      ),
    };
  }

  /// Returns `true` if the app is running in production mode.
  bool get isProduction => flavor == Flavor.production;

  /// Returns `true` if the app is running in staging mode.
  bool get isStaging => flavor == Flavor.staging;

  /// Returns `true` if the app is running in development mode.
  bool get isDevelopment => flavor == Flavor.development;
}
