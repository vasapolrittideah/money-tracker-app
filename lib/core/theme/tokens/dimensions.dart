/// A type-safe spacing and sizing scale based on a 4 pt grid.
///
/// Each token name (`dimN`) maps to a Tailwind-style scale where N is the
/// Tailwind unit and the value is `N * 4` logical pixels. Exceptions:
/// - [dim0] → 0 px (no spacing)
/// - [dimPx] → 1 px (hairline / divider)
/// - [dim0_5] → 2 px (half-unit)
/// - [dim1_5] → 6 px (1.5 units)
/// - [dim2_5] → 10 px (2.5 units)
///
/// Prefer these tokens over hard-coded values so that spacing stays consistent
/// and can be adjusted globally in one place.
class AppDimensions {
  const AppDimensions({
    required this.dim0,
    required this.dimPx,
    required this.dim0_5,
    required this.dim1,
    required this.dim1_5,
    required this.dim2,
    required this.dim2_5,
    required this.dim3,
    required this.dim4,
    required this.dim5,
    required this.dim6,
    required this.dim7,
    required this.dim8,
    required this.dim9,
    required this.dim10,
    required this.dim11,
    required this.dim12,
    required this.dim14,
    required this.dim16,
    required this.dim20,
    required this.dim24,
    required this.dim28,
    required this.dim32,
    required this.dim36,
    required this.dim40,
    required this.dim44,
    required this.dim48,
    required this.dim52,
    required this.dim56,
    required this.dim60,
    required this.dim64,
    required this.dim72,
    required this.dim80,
    required this.dim96,
    required this.dim104,
    required this.dim112,
    required this.dim128,
    required this.dim144,
    required this.dim160,
    required this.dim176,
    required this.dim192,
    required this.dim208,
    required this.dim224,
    required this.dim240,
    required this.dim256,
  });

  /// The default 4 pt grid scale. Values are in logical pixels.
  static const base = AppDimensions(
    dim0: 0,      // 0 px
    dimPx: 1,     // 1 px — hairline / divider
    dim0_5: 2,    // 2 px
    dim1: 4,      // 4 px
    dim1_5: 6,    // 6 px
    dim2: 8,      // 8 px
    dim2_5: 10,   // 10 px
    dim3: 12,     // 12 px
    dim4: 16,     // 16 px
    dim5: 20,     // 20 px
    dim6: 24,     // 24 px
    dim7: 28,     // 28 px
    dim8: 32,     // 32 px
    dim9: 36,     // 36 px
    dim10: 40,    // 40 px
    dim11: 44,    // 44 px — minimum tap target height (HIG / Material)
    dim12: 48,    // 48 px
    dim14: 56,    // 56 px
    dim16: 64,    // 64 px
    dim20: 80,    // 80 px
    dim24: 96,    // 96 px
    dim28: 112,   // 112 px
    dim32: 128,   // 128 px
    dim36: 144,   // 144 px
    dim40: 160,   // 160 px
    dim44: 176,   // 176 px
    dim48: 192,   // 192 px
    dim52: 208,   // 208 px
    dim56: 224,   // 224 px
    dim60: 240,   // 240 px
    dim64: 256,   // 256 px
    dim72: 288,   // 288 px
    dim80: 320,   // 320 px
    dim96: 384,   // 384 px
    dim104: 416,  // 416 px
    dim112: 448,  // 448 px
    dim128: 512,  // 512 px
    dim144: 576,  // 576 px
    dim160: 640,  // 640 px
    dim176: 704,  // 704 px
    dim192: 768,  // 768 px
    dim208: 832,  // 832 px
    dim224: 896,  // 896 px
    dim240: 960,  // 960 px
    dim256: 1024, // 1024 px
  );

  final double dim0;
  final double dimPx;
  final double dim0_5;
  final double dim1;
  final double dim1_5;
  final double dim2;
  final double dim2_5;
  final double dim3;
  final double dim4;
  final double dim5;
  final double dim6;
  final double dim7;
  final double dim8;
  final double dim9;
  final double dim10;
  final double dim11;
  final double dim12;
  final double dim14;
  final double dim16;
  final double dim20;
  final double dim24;
  final double dim28;
  final double dim32;
  final double dim36;
  final double dim40;
  final double dim44;
  final double dim48;
  final double dim52;
  final double dim56;
  final double dim60;
  final double dim64;
  final double dim72;
  final double dim80;
  final double dim96;
  final double dim104;
  final double dim112;
  final double dim128;
  final double dim144;
  final double dim160;
  final double dim176;
  final double dim192;
  final double dim208;
  final double dim224;
  final double dim240;
  final double dim256;
}
