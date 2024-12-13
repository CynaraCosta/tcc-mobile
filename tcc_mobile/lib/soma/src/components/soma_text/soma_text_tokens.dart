import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/src/core/tokens/components/tokenizable_component.dart';
import 'package:tcc_mobile/soma/src/core/tokens/design.dart';

abstract class SomaTypographyTokens implements TokenizableComponent {
  SomaTypographyTokens({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.description,
  });

  final SomaTextTokens title1;
  final SomaTextTokens title2;
  final SomaTextTokens title3;
  final SomaTextTokens description;
}

class BaseSomaTypographyTokens implements SomaTypographyTokens {
  BaseSomaTypographyTokens({
    required this.designTokens,
  });
  @override
  SomaDesignTokens designTokens;

  @override
  SomaTextTokens get description => BaseSomaDescription(
        designTokens: designTokens,
      );

  @override
  SomaTextTokens get title1 => BaseSomaTitle1(designTokens: designTokens);

  @override
  SomaTextTokens get title2 => BaseSomaTitle2(designTokens: designTokens);

  @override
  SomaTextTokens get title3 => BaseSomaTitle3(designTokens: designTokens);
}

class BaseSomaTypographyInverseTokens implements SomaTypographyTokens {
  BaseSomaTypographyInverseTokens({
    required this.designTokens,
  });
  @override
  SomaDesignTokens designTokens;

  @override
  SomaTextTokens get description => BaseSomaDescriptionInverse(
        designTokens: designTokens,
      );

  @override
  SomaTextTokens get title1 => BaseSomaTitle1Inverse(
        designTokens: designTokens,
      );

  @override
  SomaTextTokens get title2 => BaseSomaTitle2Inverse(
        designTokens: designTokens,
      );

  @override
  SomaTextTokens get title3 => BaseSomaTitle3Inverse(
        designTokens: designTokens,
      );
}

abstract class SomaTextTokens implements TokenizableComponent {
  SomaTextTokens({
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
    required this.fontFamily,
  });

  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final String fontFamily;
}

class BaseSomaTitle1 implements SomaTextTokens {
  BaseSomaTitle1({
    required this.designTokens,
  });

  @override
  SomaDesignTokens designTokens;

  @override
  String get fontFamily => designTokens.fonts.family.base;

  @override
  double get fontSize => designTokens.fonts.size.md;

  @override
  FontWeight get fontWeight => designTokens.fonts.weight.semiBold;

  @override
  Color get textColor => designTokens.colors.fontColor.dark.primary;
}

class BaseSomaTitle1Inverse extends BaseSomaTitle1 {
  BaseSomaTitle1Inverse({required super.designTokens});

  @override
  Color get textColor => designTokens.colors.fontColor.light.primary;
}

class BaseSomaTitle2 implements SomaTextTokens {
  BaseSomaTitle2({
    required this.designTokens,
  });

  @override
  SomaDesignTokens designTokens;

  @override
  String get fontFamily => designTokens.fonts.family.base;

  @override
  double get fontSize => designTokens.fonts.size.sm;

  @override
  FontWeight get fontWeight => designTokens.fonts.weight.semiBold;

  @override
  Color get textColor => designTokens.colors.fontColor.dark.primary;
}

class BaseSomaTitle2Inverse extends BaseSomaTitle2 {
  BaseSomaTitle2Inverse({required super.designTokens});

  @override
  Color get textColor => designTokens.colors.fontColor.light.primary;
}

class BaseSomaTitle3 implements SomaTextTokens {
  BaseSomaTitle3({
    required this.designTokens,
  });

  @override
  SomaDesignTokens designTokens;

  @override
  String get fontFamily => designTokens.fonts.family.base;

  @override
  double get fontSize => designTokens.fonts.size.sm;

  @override
  FontWeight get fontWeight => designTokens.fonts.weight.medium;

  @override
  Color get textColor => designTokens.colors.fontColor.dark.primary;
}

class BaseSomaTitle3Inverse extends BaseSomaTitle3 {
  BaseSomaTitle3Inverse({required super.designTokens});

  @override
  Color get textColor => designTokens.colors.fontColor.light.primary;
}

class BaseSomaDescription implements SomaTextTokens {
  BaseSomaDescription({
    required this.designTokens,
  });

  @override
  SomaDesignTokens designTokens;

  @override
  String get fontFamily => designTokens.fonts.family.base;

  @override
  double get fontSize => designTokens.fonts.size.xs;

  @override
  FontWeight get fontWeight => designTokens.fonts.weight.light;

  @override
  Color get textColor => designTokens.colors.fontColor.dark.primary;
}

class BaseSomaDescriptionInverse extends BaseSomaDescription {
  BaseSomaDescriptionInverse({required super.designTokens});

  @override
  Color get textColor => designTokens.colors.fontColor.light.primary;
}
