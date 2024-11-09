import 'package:tcc_mobile/soma/soma.dart';

class BaseSomaComponentTokens implements SomaComponentTokens {
  BaseSomaComponentTokens({
    required SomaDesignTokens designTokens,
  })  : defaultTokens = BaseSomaComponents(designTokens: designTokens),
        inverse = BaseSomaComponentsInverse(designTokens: designTokens);

  @override
  SomaComponents defaultTokens;

  @override
  SomaComponents inverse;
}

class BaseSomaComponents implements SomaComponents {
  BaseSomaComponents({
    required this.designTokens,
  });

  SomaDesignTokens designTokens;
}

class BaseSomaComponentsInverse extends BaseSomaComponents {
  BaseSomaComponentsInverse({required super.designTokens});
}
