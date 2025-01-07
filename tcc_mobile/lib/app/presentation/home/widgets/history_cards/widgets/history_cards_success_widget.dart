import 'package:flutter/widgets.dart';
import '../domain/entity/history_cards_entity.dart';

class HistoryCardsSuccessWidget extends StatelessWidget {
  const HistoryCardsSuccessWidget({
    required this.entity,
    super.key,
  });

  final HistoryCardsEntity entity;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}