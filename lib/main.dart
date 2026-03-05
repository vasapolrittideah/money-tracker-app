import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final _reportedErrors = Expando<bool>('reportedErrors');

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (FlutterErrorDetails details) {
        _handleError(details, details.stack, context: 'Flutter error');
      };

      await _initializeServices();
      await _configureSystemUI();

      // TODO: Run the app
    },
    (error, stackTrace) {
      _handleError(error, stackTrace, context: 'Uncaught error');
    },
  );
}

Future<void> _initializeServices() async {
  try {
    debugPrint('🎉 Services initialized successfully');
  } catch (error, stackTrace) {
    _handleError(error, stackTrace, context: 'Service initialization error');
    rethrow;
  }
}

/// Configures system UI elements such as status bar and navigation bar.
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

void _handleError(Object error, StackTrace? stackTrace, {String? context}) {
  if (_reportedErrors[error] == true) return;
  _reportedErrors[error] = true;

  if (error is FlutterErrorDetails) {
    if (kDebugMode) {
      FlutterError.presentError(error);
    }
  } else {
    if (kDebugMode) {
      FlutterError.presentError(FlutterErrorDetails(exception: error, stack: stackTrace, library: context));
    }
  }
}
