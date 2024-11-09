import 'package:flutter/material.dart';

class SomaSpacing {
  SomaSpacing({
    required this.inline,
    required this.insetVertical,
    required this.insetHorizontal,
  });

  SomaSpacingInline inline;
  SomaSpacingInsetVertical insetVertical;
  SomaSpacingInsetHorizontal insetHorizontal;
}

class SomaSpacingInline {
  SomaSpacingInline({
    required this.xxxs,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  /// 4
  double xxxs;

  /// 8
  double xxs;

  /// 16
  double xs;

  /// 24
  double sm;

  /// 32
  double md;

  /// 40
  double lg;

  /// 48
  double xl;
}

class SomaSpacingInsetVertical {
  SomaSpacingInsetVertical({
    required this.xxxs,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  // EdgeInsets.symetric(vertical: 4, horizontal: 0)
  EdgeInsets xxxs;

  // EdgeInsets.symetric(vertical: 8, horizontal: 0)
  EdgeInsets xxs;

  // EdgeInsets.symetric(vertical: 16, horizontal: 0)
  EdgeInsets xs;

  // EdgeInsets.symetric(vertical: 24, horizontal: 0)
  EdgeInsets sm;

  // EdgeInsets.symetric(vertical: 32, horizontal: 0)
  EdgeInsets md;

  // EdgeInsets.symetric(vertical: 40, horizontal: 0)
  EdgeInsets lg;
}

class SomaSpacingInsetHorizontal {
  SomaSpacingInsetHorizontal({
    required this.xxxs,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  // EdgeInsets.symetric(vertical: 0, horizontal: 4)
  EdgeInsets xxxs;

  // EdgeInsets.symetric(vertical: 0, horizontal: 8)
  EdgeInsets xxs;

  // EdgeInsets.symetric(vertical: 0, horizontal: 16)
  EdgeInsets xs;

  // EdgeInsets.symetric(vertical: 0, horizontal: 24)
  EdgeInsets sm;

  // EdgeInsets.symetric(vertical: 0, horizontal: 32)
  EdgeInsets md;

  // EdgeInsets.symetric(vertical: 0, horizontal: 40)
  EdgeInsets lg;
}