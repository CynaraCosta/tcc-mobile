import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/app/presentation/home/widgets/history_cards/resources/history_cards_strings.dart';
import 'package:tcc_mobile/commons/router/src/app_navigator.dart';
import 'package:tcc_mobile/soma/soma.dart';
import '../domain/entity/history_cards_entity.dart';

class HistoryCardsSuccessWidget extends StatelessWidget {
  const HistoryCardsSuccessWidget({
    required this.entity,
    required this.navigator,
    super.key,
  });

  final HistoryCardsEntity entity;
  final AppNavigator navigator;

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SomaText(
                text: entity.title,
                type: SomaTypographyType.title1,
              ),
              SomaText(
                text: HistoryCardsStrings.seeMore,
                type: SomaTypographyType.title3,
                customTextStyle: TextStyle(
                  color: tokens.colors.brand.brand,
                ),
              ),
            ],
          ),
          SizedBox(
            height: tokens.spacings.inline.xs,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: entity.cards.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) {
              final card = entity.cards[index];
              return Column(
                children: [
                  HistoryCard(
                    icon: card.icon,
                    title: card.title,
                    onTap: () {
                      if (card.deeplink != null) {
                        navigator.pushToUrl(Uri.parse(card.deeplink!));
                      }
                    },
                  ),
                  if (index != entity.cards.length - 1)
                    SizedBox(height: tokens.spacings.inline.xs),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
