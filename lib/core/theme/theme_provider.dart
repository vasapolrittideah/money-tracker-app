import 'package:flutter/material.dart';
import 'package:money_tracker/core/theme/theme.dart';
import 'package:money_tracker/core/theme/tokens/color_schema.dart';
import 'package:money_tracker/core/theme/tokens/dimensions.dart';
import 'package:money_tracker/core/theme/tokens/shadows.dart';
import 'package:money_tracker/core/theme/tokens/typography.dart';

/// An [InheritedWidget] that propagates [AppTheme] down the widget tree.
/// Wrap the app (or a subtree) with this widget to make the theme accessible
/// to any descendant via [AppThemeProvider.of] or the [AppThemeContext] extension.
class AppThemeProvider extends InheritedWidget {
  const AppThemeProvider({super.key, required this.theme, required super.child});

  final AppTheme theme;

  /// Looks up the nearest [AppThemeProvider] ancestor and returns its [AppTheme].
  /// Throws an assertion error if no provider is found in the widget tree.
  static AppTheme of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<AppThemeProvider>();
    assert(provider != null, 'AppThemeProvider is not found in the widget tree');
    return provider!.theme;
  }

  /// Notifies dependents whenever the [theme] instance changes.
  @override
  bool updateShouldNotify(AppThemeProvider oldWidget) => theme != oldWidget.theme;
}

/// Convenience extension on [BuildContext] for accessing theme tokens directly.
/// Instead of `AppThemeProvider.of(context).colorSchema`, you can write `context.colors`.
extension AppThemeContext on BuildContext {
  /// The current [AppTheme].
  AppTheme get theme => AppThemeProvider.of(this);

  /// Shorthand for `theme.colorSchema`.
  AppColorSchema get colors => theme.colorSchema;

  /// Shorthand for `theme.typography`.
  AppTypography get typography => theme.typography;

  /// Shorthand for `theme.dimensions`.
  AppDimensions get dimensions => theme.dimensions;

  /// Shorthand for `theme.shadows`.
  AppShadows get shadows => theme.shadows;
}
