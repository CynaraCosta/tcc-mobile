import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/soma/soma.dart';

class CardStyle {
  CardStyle({
    required this.tokens,
  });

  final CardTokens tokens;

  Color get bgColor => tokens.bgColor;
  Color get iconColor => tokens.iconColor;
  Color get shadowColor => tokens.shadowColor;
  double get heightPercent => tokens.heightPercent;
  double get widthPercent => tokens.widthPercent;
  double get doubleOpacity => tokens.doubleOpacity;
  Offset get offset => tokens.offset;
  double get blurRadius => tokens.blurRadius;
  double get spreadRadius => tokens.spreadRadius;
}
