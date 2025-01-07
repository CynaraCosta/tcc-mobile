import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

abstract class SomaSkeletonTokens implements TokenizableComponent {
  SomaSkeletonTokens({
    required this.gradient,
    required this.stops,
    required this.colors,
    required this.begin,
    required this.end,
    required this.tileMode,
    required this.duration,
  });

  final LinearGradient gradient;
  final List<double> stops;
  final List<Color> colors;
  final Alignment begin;
  final Alignment end;
  final TileMode tileMode;
  final Duration duration;
}

class BaseSomaSkeletonTokens implements SomaSkeletonTokens {
  BaseSomaSkeletonTokens({required this.designTokens});

  @override
  SomaDesignTokens designTokens;

  @override
  Alignment get begin => const Alignment(-3.0, -0.3);

  @override
  List<Color> get colors => [
        designTokens.colors.background.light.primary,
        designTokens.colors.background.light.secondary,
        designTokens.colors.background.light.ternary,
      ];

  @override
  Duration get duration => const Duration(milliseconds: 1000);

  @override
  Alignment get end => const Alignment(3.0, 0.3);

  @override
  List<double> get stops => const [
        0.1,
        0.3,
        0.4,
      ];

  @override
  TileMode get tileMode => TileMode.clamp;

  @override
  LinearGradient get gradient => LinearGradient(
        colors: colors,
        stops: stops,
        begin: begin,
        end: end,
        tileMode: tileMode,
      );
}

class BaseSomaSkeletonTokensInverse extends BaseSomaSkeletonTokens {
  BaseSomaSkeletonTokensInverse({required super.designTokens});

  @override
  List<Color> get colors => [
        designTokens.colors.background.dark.primary,
        designTokens.colors.background.dark.secondary,
        designTokens.colors.background.dark.ternary,
      ];
}