abstract class SomaComponentTokens {
  SomaComponentTokens({
    required this.defaultTokens,
    required this.inverse,
  });
  final SomaComponents defaultTokens;
  final SomaComponents inverse;
}

abstract class SomaComponents {
  SomaComponents();
}
