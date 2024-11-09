import 'package:tcc_mobile/soma/soma.dart';

abstract class SomaDesignTokens {
  SomaDesignTokens(
    this.colors,
    this.fonts,
    this.spacings,
  );

  final SomaColor colors;
  final SomaFont fonts;
  final SomaSpacing spacings;
}
