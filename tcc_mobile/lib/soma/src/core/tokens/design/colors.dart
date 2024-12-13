import 'package:flutter/material.dart';

abstract class SomaColor {
  SomaColor({
    required this.background,
    required this.fontColor,
    required this.brand,
  });

  SomaColorBackground background;
  SomaColorFont fontColor;
  SomaColorBrand brand;
}

abstract class SomaColorBackground {
  SomaColorBackground({
    required this.light,
    required this.dark,
  });

  SomaColorBackgroundDefaultRange light;
  SomaColorBackgroundDefaultRange dark;
}

class SomaColorBackgroundDefaultRange {
  SomaColorBackgroundDefaultRange({
    required this.primary,
    required this.secondary,
    required this.ternary,
  });

  Color primary;
  Color secondary;
  Color ternary;
}

abstract class SomaColorFont {
  SomaColorFont({
    required this.light,
    required this.dark,
  });

  SomaColorFontDefaultRange light;
  SomaColorFontDefaultRange dark;
}

class SomaColorFontDefaultRange {
  SomaColorFontDefaultRange({
    required this.primary,
  });

  Color primary;
}

class SomaColorBrand {
  SomaColorBrand({
    required this.brand,
  });

  Color brand;
}
