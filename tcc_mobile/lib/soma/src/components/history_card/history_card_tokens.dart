import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

abstract class HistoryCardTokens implements TokenizableComponent {
  HistoryCardTokens({
    required this.bgColor,
    required this.iconColor,
  });
  final Color bgColor;
  final Color iconColor;
}

class BaseHistoryCardTokens implements HistoryCardTokens {
  BaseHistoryCardTokens({
    required this.designTokens,
  });
  @override
  SomaDesignTokens designTokens;

  @override
  Color get bgColor => designTokens.colors.background.light.secondary;

  @override
  Color get iconColor => designTokens.colors.brand.brand;
}

class BaseHistoryCardTokensInverse extends BaseHistoryCardTokens {
  BaseHistoryCardTokensInverse({required super.designTokens});

  @override
  Color get bgColor => designTokens.colors.background.dark.secondary;
}
