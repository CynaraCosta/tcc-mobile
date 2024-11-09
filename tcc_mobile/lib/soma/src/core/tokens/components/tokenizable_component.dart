import 'package:tcc_mobile/soma/soma.dart';

abstract class TokenizableComponent {
  TokenizableComponent({
    required this.designTokens,
  });
  SomaDesignTokens designTokens;
}