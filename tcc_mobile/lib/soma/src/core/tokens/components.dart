import 'package:tcc_mobile/soma/soma.dart';

abstract class SomaComponentTokens {
  SomaComponentTokens({
    required this.defaultTokens,
    required this.inverse,
  });
  final SomaComponents defaultTokens;
  final SomaComponents inverse;
}

abstract class SomaComponents {
  SomaComponents({
    required this.typography,
  });

  final SomaTypographyTokens typography;
}
