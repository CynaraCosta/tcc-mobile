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

  @override
  SomaTypographyTokens get typography => BaseSomaTypographyTokens(
        designTokens: designTokens,
      );

  @override
  CardTokens get card => BaseCardTokens(designTokens: designTokens);

  @override
  SomaSkeletonTokens get skeleton => BaseSomaSkeletonTokens(
        designTokens: designTokens,
      );

  @override
  HistoryCardTokens get historyCard =>
      BaseHistoryCardTokens(designTokens: designTokens);
}

class BaseSomaComponentsInverse extends BaseSomaComponents {
  BaseSomaComponentsInverse({required super.designTokens});

  @override
  SomaTypographyTokens get typography => BaseSomaTypographyInverseTokens(
        designTokens: designTokens,
      );

  @override
  CardTokens get card => BaseCardTokensInverse(designTokens: designTokens);

  @override
  SomaSkeletonTokens get skeleton => BaseSomaSkeletonTokensInverse(
        designTokens: designTokens,
      );

  @override
  HistoryCardTokens get historyCard =>
      BaseHistoryCardTokensInverse(designTokens: designTokens);
}
