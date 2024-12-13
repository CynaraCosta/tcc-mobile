import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/soma/src/core/tokens/components/tokenizable_component.dart';
import 'package:tcc_mobile/soma/src/core/tokens/design.dart';

abstract class CardTokens implements TokenizableComponent {
  CardTokens({
    required this.bgColor,
    required this.iconColor,
    required this.shadowColor,
    required this.heightPercent,
    required this.widthPercent,
    required this.doubleOpacity,
    required this.offset,
    required this.blurRadius,
    required this.spreadRadius,
  });

  final Color bgColor;
  final Color iconColor;
  final Color shadowColor;
  final double heightPercent;
  final double widthPercent;
  final double doubleOpacity;
  final Offset offset;
  final double blurRadius;
  final double spreadRadius;
}

class BaseCardTokens implements CardTokens {
  BaseCardTokens({
    required this.designTokens,
  });

  @override
  SomaDesignTokens designTokens;

  @override
  Color get bgColor => designTokens.colors.background.light.secondary;

  @override
  double get blurRadius => 10;

  @override
  double get doubleOpacity => 0.15;

  @override
  double get heightPercent => 0.189;

  @override
  Color get iconColor => designTokens.colors.fontColor.dark.primary;

  @override
  Offset get offset => const Offset(0, 5);

  @override
  double get spreadRadius => 6;

  @override
  double get widthPercent => 0.41;
  
  @override
  Color get shadowColor => designTokens.colors.background.dark.ternary;
}

class BaseCardTokensInverse extends BaseCardTokens {
  BaseCardTokensInverse({required super.designTokens});

  @override
  Color get bgColor => designTokens.colors.background.dark.secondary;

  @override
  Color get iconColor => designTokens.colors.background.light.secondary;
}
