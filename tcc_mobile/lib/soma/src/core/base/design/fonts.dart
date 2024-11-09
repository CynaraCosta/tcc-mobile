import 'package:flutter/material.dart';
import 'package:tcc_mobile/gen/fonts.gen.dart';
import 'package:tcc_mobile/soma/soma.dart';

class BaseSomaFont implements SomaFont {
  @override
  SomaFontFamily family = BaseSomaFontFamily();

  @override
  SomaFontSize size = BaseSomaFontSize();

  @override
  SomaFontWeight weight = BaseSomaFontWeight();
}

class BaseSomaFontFamily implements SomaFontFamily {
  BaseSomaFontFamily({
    String? base,
  }) {
    this.base = base ?? this.base;
  }

  @override
  String base = FontFamily.inter;
}

class BaseSomaFontSize implements SomaFontSize {
  BaseSomaFontSize({
    double? xxxs,
    double? xxs,
    double? xs,
    double? sm,
    double? lg,
  }) {
    this.xxxs = xxxs ?? this.xxxs;
    this.xxs = xxs ?? this.xxs;
    this.xs = xs ?? this.xs;
    this.sm = sm ?? this.sm;
    this.lg = lg ?? this.lg;
  }

  @override
  double xxxs = 8;

  @override
  double xxs = 12;

  @override
  double xs = 14;

  @override
  double sm = 16;

  @override
  double md = 20;

  @override
  double lg = 24;
  
  @override
  double xl = 40;
}

class BaseSomaFontWeight implements SomaFontWeight {
  BaseSomaFontWeight({
    FontWeight? extraBold,
    FontWeight? bold,
    FontWeight? medium,
    FontWeight? regular,
    FontWeight? light,
    FontWeight? semiBold,
  }) {
    this.extraBold = extraBold ?? this.extraBold;
    this.bold = bold ?? this.bold;
    this.medium = medium ?? this.medium;
    this.regular = regular ?? this.regular;
    this.light = light ?? this.light;
    this.semiBold = semiBold ?? this.semiBold;
  }

  @override
  FontWeight light = FontWeight.w300;

  @override
  FontWeight extraBold = FontWeight.w800;

  @override
  FontWeight semiBold = FontWeight.w600;

  @override
  FontWeight bold = FontWeight.w700;

  @override
  FontWeight medium = FontWeight.w500;

  @override
  FontWeight regular = FontWeight.w400;
}