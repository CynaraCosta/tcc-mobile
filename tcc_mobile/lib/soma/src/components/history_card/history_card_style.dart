import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

class HistoryCardStyle {
  HistoryCardStyle({
    required this.tokens,
  });

  final HistoryCardTokens tokens;

  Color get bgColor => tokens.bgColor;
  Color get iconColor => tokens.iconColor;
}
