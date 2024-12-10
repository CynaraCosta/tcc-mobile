import 'package:tcc_mobile/soma/src/core/base/support/icons_string.dart';

enum SomaIconType {
  message(SomaIconsStrings.message),
  gallery(SomaIconsStrings.gallery);

  const SomaIconType(this.value);

  final String value;
}

enum SomaIconSize {
  sm(16),
  md(24),
  lg(32);

  const SomaIconSize(this.size);

  final double size;
}
