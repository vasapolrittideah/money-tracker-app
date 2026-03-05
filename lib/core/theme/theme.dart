import 'package:money_tracker/core/theme/tokens/color_schema.dart';
import 'package:money_tracker/core/theme/tokens/dimensions.dart';
import 'package:money_tracker/core/theme/tokens/shadows.dart';
import 'package:money_tracker/core/theme/tokens/typography.dart';

/// The root theme object that aggregates all design tokens for the app.
/// Holds references to color schema, typography, dimensions, and shadows.
class AppTheme {
  const AppTheme({
    required this.colorSchema,
    required this.typography,
    required this.dimensions,
    required this.shadows,
  });

  /// Semantic color tokens for the current theme.
  final AppColorSchema colorSchema;

  /// Text style definitions for the current theme.
  final AppTypography typography;

  /// Spacing and sizing scale for the current theme.
  final AppDimensions dimensions;

  /// Box shadow definitions for the current theme.
  final AppShadows shadows;

  /// Default token values for the light mode theme.
  static final light = AppTheme(
    colorSchema: AppColorSchema.light,
    typography: AppTypography.scaled(),
    dimensions: AppDimensions.base,
    shadows: AppShadows.base,
  );
}
