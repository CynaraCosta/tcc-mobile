import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

class LogoStyle {
  LogoStyle({
    required this.tokens,
  });

  final LogoTokens tokens;

  Color get bgColor => tokens.bgColor;
  double get widthDouble => 0.39;
  double get heightDouble => 0.39;
}
