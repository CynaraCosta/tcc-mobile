import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

enum SomaTypographyType {
  title1,
  title2,
  title3,
  description;

  SomaTextTokens getTokens(BuildContext context) {
    switch (this) {
      case title1:
        return SomaTheme.getComponentTokensOf(context).typography.title1;
      case title2:
        return SomaTheme.getComponentTokensOf(context).typography.title2;
      case title3:
        return SomaTheme.getComponentTokensOf(context).typography.title3;
      case description:
        return SomaTheme.getComponentTokensOf(context).typography.description;
      default:
        throw Exception('Not a typography known');
    }
  }
}
