import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_tracker/src/app.dart';
import 'package:money_tracker/src/core/config/app_config.dart';

/// Tracks errors that have already been reported to avoid duplicate logging.
final _reportedErrors = Expando<bool>('reportedErrors');

/// Entry point. Wraps the app in [runZonedGuarded] to catch both Flutter
/// framework errors and unhandled Dart exceptions before starting the app.
Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (FlutterErrorDetails details) {
        _handleError(details, details.stack, context: 'Flutter error');
      };

      await _initializeServices();
      await _configureSystemUI();

      final container = ProviderContainer(overrides: [appConfigProvider.overrideWithValue(await AppConfig.fromEnv())]);
      runApp(
        UncontrolledProviderScope(
          container: container,
          child: MoneyTrackerApp(container: container),
        ),
      );
    },
    (error, stackTrace) {
      _handleError(error, stackTrace, context: 'Uncaught error');
    },
  );
}

/// Initialises third-party services and dependencies (e.g. analytics, crash
/// reporting). Errors here are fatal — the app will not continue.
Future<void> _initializeServices() async {
  try {
    debugPrint('🎉 Services initialized successfully');
  } catch (error, stackTrace) {
    _handleError(error, stackTrace, context: 'Service initialization error');
    rethrow;
  }
}

/// Configures system UI elements such as status bar and navigation bar.
/// Errors here are non-fatal — the app can continue with default system UI settings.
Future<void> _configureSystemUI() async {
  try {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    if (Platform.isAndroid) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  } catch (error, stackTrace) {
    _handleError(error, stackTrace, context: 'System UI configuration error');
    // Don't rethrow because the application can continue without these settings.
  }
}

/// Logs [error] with its [stackTrace] to the appropriate reporting channel.
/// Subsequent occurrences of the same error instance are silently ignored to
/// prevent duplicate reports.
void _handleError(Object error, StackTrace? stackTrace, {String? context}) {
  if (_reportedErrors[error] == true) return;
  _reportedErrors[error] = true;

  if (error is FlutterErrorDetails) {
    if (kDebugMode) {
      FlutterError.presentError(error);
    }

    // In production, send the error details to a remote logging service
    // instead of printing to console. Use the `error.exception` and
    // `error.stack` properties from the FlutterErrorDetails object.
  } else {
    if (kDebugMode) {
      FlutterError.presentError(FlutterErrorDetails(exception: error, stack: stackTrace, library: context));
    }

    // In production, send the error and stack trace to a remote logging
    // service instead of printing to console. Use the `error` and
    // `stackTrace` parameters directly.
  }
}
