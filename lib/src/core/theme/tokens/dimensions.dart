/// A type-safe spacing and sizing scale based on a 4 pt grid.
///
/// Token names follow a Tailwind-style scale where N maps to `N * 4` logical
/// pixels. Prefer these tokens over hard-coded values so that spacing stays
/// consistent and can be adjusted globally in one place.
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
    dim0: 0,
    dimPx: 1,
    dim0_5: 2,
    dim1: 4,
    dim1_5: 6,
    dim2: 8,
    dim2_5: 10,
    dim3: 12,
    dim4: 16,
    dim5: 20,
    dim6: 24,
    dim7: 28,
    dim8: 32,
    dim9: 36,
    dim10: 40,
    dim11: 44,
    dim12: 48,
    dim14: 56,
    dim16: 64,
    dim20: 80,
    dim24: 96,
    dim28: 112,
    dim32: 128,
    dim36: 144,
    dim40: 160,
    dim44: 176,
    dim48: 192,
    dim52: 208,
    dim56: 224,
    dim60: 240,
    dim64: 256,
    dim72: 288,
    dim80: 320,
    dim96: 384,
    dim104: 416,
    dim112: 448,
    dim128: 512,
    dim144: 576,
    dim160: 640,
    dim176: 704,
    dim192: 768,
    dim208: 832,
    dim224: 896,
    dim240: 960,
    dim256: 1024,
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
