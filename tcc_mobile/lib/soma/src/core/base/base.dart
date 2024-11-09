import 'package:tcc_mobile/soma/soma.dart';

class BaseSomaDesignTokens implements SomaDesignTokens {
  @override
  final SomaColor colors = BaseSomaColor();

  @override
  final SomaFont fonts = BaseSomaFont();

  @override
  final SomaSpacing spacings = BaseSomaSpacing();
}