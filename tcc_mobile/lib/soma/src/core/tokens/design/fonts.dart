import 'package:flutter/material.dart';

class SomaFont {
  SomaFont({
    required this.family,
    required this.size,
    required this.weight,
  });

  SomaFontFamily family;
  SomaFontSize size;
  SomaFontWeight weight;
}

class SomaFontFamily {
  SomaFontFamily({
    required this.base,
  });

  String base;
}

class SomaFontSize {
  SomaFontSize({
    required this.xxxs,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  /// 8
  double xxxs;

  /// 12
  double xxs;

  /// 14
  double xs;

  /// 16
  double sm;

  /// 20
  double md;

  /// 24
  double lg;

  /// 40
  double xl;
}

class SomaFontWeight {
  SomaFontWeight({
    required this.light,
    required this.regular,
    required this.medium,
    required this.bold,
    required this.semiBold,
    required this.extraBold,
  });

  FontWeight light;
  FontWeight regular;
  FontWeight medium;
  FontWeight semiBold;
  FontWeight bold;
  FontWeight extraBold;
}
