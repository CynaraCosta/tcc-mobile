import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/history_cards/resources/history_cards_strings.dart';
import 'package:tcc_mobile/soma/soma.dart';

class HistoryCardsErrorWidget extends StatelessWidget {
  const HistoryCardsErrorWidget({
    this.onTapError,
    super.key,
  });

  final void Function()? onTapError;

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);

    return GestureDetector(
      onTap: onTapError,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SomaIcon(
            type: SomaIconType.rotateRight,
            color: tokens.colors.brand.brand,
            size: SomaIconSize.md,
          ),
          SizedBox(
            height: tokens.spacings.inline.xxs,
          ),
          const SomaText(
            text: HistoryCardsStrings.errorTitle,
            type: SomaTypographyType.title3,
          ),
          SizedBox(
            height: tokens.spacings.inline.xxxs,
          ),
          const SomaText(
            text: HistoryCardsStrings.errorDescription,
            type: SomaTypographyType.description,
          ),
        ],
      ),
    );
  }
}