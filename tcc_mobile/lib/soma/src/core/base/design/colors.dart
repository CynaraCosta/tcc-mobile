import 'dart:ui';

import 'package:tcc_mobile/gen/colors.gen.dart';
import 'package:tcc_mobile/soma/soma.dart';

class BaseSomaColor implements SomaColor {
  @override
  SomaColorBackground background = BaseSomaColorBackground();

  @override
  SomaColorBrand brand = BaseSomaColorBrand();

  @override
  SomaColorFont fontColor = BaseSomaColorFont();
}

class BaseSomaColorBackground implements SomaColorBackground {
  @override
  SomaColorBackgroundDefaultRange dark = BaseSomaColorBackgroundDark();

  @override
  SomaColorBackgroundDefaultRange light = BaseSomaColorBackgroundLight();
}

class BaseSomaColorBackgroundLight implements SomaColorBackgroundDefaultRange {
  BaseSomaColorBackgroundLight({
    Color? primary,
    Color? secondary,
  }) {
    this.primary = primary ?? this.primary;
    this.secondary = secondary ?? this.secondary;
  }
  @override
  Color primary = ColorName.lightBackgroundPrimary;

  @override
  Color secondary = ColorName.lightBackgroundSecondary;

  @override
  Color ternary = ColorName.lightBackgroundSecondary;
}

class BaseSomaColorBackgroundDark implements SomaColorBackgroundDefaultRange {
  BaseSomaColorBackgroundDark({
    Color? primary,
    Color? secondary,
  }) {
    this.primary = primary ?? this.primary;
    this.secondary = secondary ?? this.secondary;
  }
  @override
  Color primary = ColorName.darkBackgroundPrimary;

  @override
  Color secondary = ColorName.darkBackgroundSecondary;

  @override
  Color ternary = ColorName.darkBackgroundTernary;
}

class BaseSomaColorBrand implements SomaColorBrand {
  BaseSomaColorBrand({
    Color? brand,
  }) {
    this.brand = brand ?? this.brand;
  }

  @override
  Color brand = ColorName.brand;
}

class BaseSomaColorFont implements SomaColorFont {
  @override
  SomaColorFontDefaultRange dark = BaseSomaColorFontDark();

  @override
  SomaColorFontDefaultRange light = BaseSomaColorFontLight();
}

class BaseSomaColorFontLight implements SomaColorFontDefaultRange {
  BaseSomaColorFontLight({
    Color? primary,
  }) {
    this.primary = primary ?? this.primary;
  }

  @override
  Color primary = ColorName.lightFontPrimary;
}

class BaseSomaColorFontDark implements SomaColorFontDefaultRange {
  BaseSomaColorFontDark({
    Color? primary,
  }) {
    this.primary = primary ?? this.primary;
  }

  @override
  Color primary = ColorName.darkFontPrimary;
}
