import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

abstract class LogoTokens implements TokenizableComponent {
  LogoTokens({
    required this.bgColor,
    required this.glowWidthDouble,
    required this.glowHeightDouble,
    required this.glowHigherOpacity,
    required this.glowLowerOpacity,
    required this.glowStops,
    required this.innerCircleWidthDouble,
    required this.innerCircleHeightDouble,
    required this.imageWidthDouble,
    required this.imageHeightDouble,
  });
  final Color bgColor;
  final double glowWidthDouble;
  final double glowHeightDouble;
  final double glowHigherOpacity;
  final double glowLowerOpacity;
  final List<double> glowStops;
  final double innerCircleWidthDouble;
  final double innerCircleHeightDouble;
  final double imageWidthDouble;
  final double imageHeightDouble;
}

class BaseLogoTokens implements LogoTokens {
  BaseLogoTokens({
    required this.designTokens,
  });
  @override
  SomaDesignTokens designTokens;

  @override
  Color get bgColor => designTokens.colors.background.light.primary;

  @override
  double get glowHeightDouble => 0.22;

  @override
  double get glowWidthDouble => 0.42;

  @override
  double get glowHigherOpacity => 0.4;

  @override
  double get glowLowerOpacity => 0.01;

  @override
  List<double> get glowStops => [0.6, 1.0];

  @override
  double get innerCircleHeightDouble => 0.16;

  @override
  double get innerCircleWidthDouble => 0.38;

  @override
  double get imageHeightDouble => 0.15;

  @override
  double get imageWidthDouble => 0.35;
}

class BaseLogoTokensInverse extends BaseLogoTokens {
  BaseLogoTokensInverse({required super.designTokens});

  @override
  Color get bgColor => designTokens.colors.background.dark.primary;
}
