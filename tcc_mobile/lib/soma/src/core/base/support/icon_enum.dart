import 'package:tcc_mobile/soma/src/core/base/support/icons_string.dart';

enum SomaIconType {
  message(SomaIconsStrings.message),
  gallery(SomaIconsStrings.gallery),
  rotateRight(SomaIconsStrings.rotateRight),
  arrowRight(SomaIconsStrings.arrowRight);

  const SomaIconType(this.value);

  final String value;
}

enum SomaIconSize {
  /// 16 x 16
  sm(16),

  /// 24 x 24
  md(24),

  /// 32 x 32
  lg(32);

  const SomaIconSize(this.size);

  final double size;
}
