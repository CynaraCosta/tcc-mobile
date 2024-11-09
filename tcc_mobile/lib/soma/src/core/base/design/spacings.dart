import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

class BaseSomaSpacing implements SomaSpacing {
  @override
  SomaSpacingInline inline = BaseSomaSpacingInline();

  @override
  SomaSpacingInsetVertical insetVertical = BaseSomaSpacingInsetVertical();

  @override
  SomaSpacingInsetHorizontal insetHorizontal = BaseSomaSpacingInsetHorizontal();
}

class BaseSomaSpacingInline implements SomaSpacingInline {
  BaseSomaSpacingInline({
    double? xxxs,
    double? xxs,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
  }) {
    this.xxxs = xxxs ?? this.xxxs;
    this.xxs = xxs ?? this.xxs;
    this.xs = xs ?? this.xs;
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
    this.xl = xl ?? this.xl;
  }

  @override
  double xxxs = 4;

  @override
  double xxs = 8;

  @override
  double xs = 16;

  @override
  double sm = 24;

  @override
  double md = 32;

  @override
  double lg = 40;

  @override
  double xl = 48;
}

class BaseSomaSpacingInsetVertical implements SomaSpacingInsetVertical {
  BaseSomaSpacingInsetVertical({
    EdgeInsets? xxxs,
    EdgeInsets? xxs,
    EdgeInsets? xs,
    EdgeInsets? sm,
    EdgeInsets? md,
    EdgeInsets? lg,
  }) {
    this.xxxs = xxxs ?? this.xxxs;
    this.xxs = xxs ?? this.xxs;
    this.xs = xs ?? this.xs;
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
  }

  @override
  EdgeInsets xxxs = const EdgeInsets.symmetric(vertical: 4, horizontal: 0);

  @override
  EdgeInsets xxs = const EdgeInsets.symmetric(vertical: 8, horizontal: 0);

  @override
  EdgeInsets xs = const EdgeInsets.symmetric(vertical: 16, horizontal: 0);

  @override
  EdgeInsets sm = const EdgeInsets.symmetric(vertical: 24, horizontal: 0);

  @override
  EdgeInsets md = const EdgeInsets.symmetric(vertical: 32, horizontal: 0);

  @override
  EdgeInsets lg = const EdgeInsets.symmetric(vertical: 40, horizontal: 0);
}

class BaseSomaSpacingInsetHorizontal implements SomaSpacingInsetHorizontal {
  BaseSomaSpacingInsetHorizontal({
    EdgeInsets? xxxs,
    EdgeInsets? xxs,
    EdgeInsets? xs,
    EdgeInsets? sm,
    EdgeInsets? md,
    EdgeInsets? lg,
  }) {
    this.xxxs = xxxs ?? this.xxxs;
    this.xxs = xxs ?? this.xxs;
    this.xs = xs ?? this.xs;
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
  }

  @override
  EdgeInsets xxxs = const EdgeInsets.symmetric(vertical: 0, horizontal: 4);

  @override
  EdgeInsets xxs = const EdgeInsets.symmetric(vertical: 0, horizontal: 8);

  @override
  EdgeInsets xs = const EdgeInsets.symmetric(vertical: 0, horizontal: 16);

  @override
  EdgeInsets sm = const EdgeInsets.symmetric(vertical: 0, horizontal: 24);

  @override
  EdgeInsets md = const EdgeInsets.symmetric(vertical: 0, horizontal: 32);

  @override
  EdgeInsets lg = const EdgeInsets.symmetric(vertical: 0, horizontal: 40);
}
