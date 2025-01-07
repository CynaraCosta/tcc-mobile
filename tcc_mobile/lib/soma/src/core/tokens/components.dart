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
    required this.card,
    required this.skeleton,
    required this.historyCard,
  });

  final SomaTypographyTokens typography;
  final CardTokens card;
  final SomaSkeletonTokens skeleton;
  final HistoryCardTokens historyCard;
}
