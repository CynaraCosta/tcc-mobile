import 'package:flutter/widgets.dart';

class HistoryCardsErrorWidget extends StatelessWidget {
  const HistoryCardsErrorWidget({
    this.onTapError,
    super.key,
  });

  final void Function()? onTapError;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}