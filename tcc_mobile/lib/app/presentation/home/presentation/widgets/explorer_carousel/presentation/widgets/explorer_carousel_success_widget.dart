import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/soma/soma.dart';
import '../../domain/entity/explorer_carousel_entity.dart';

class ExplorerCarouselSuccessWidget extends StatelessWidget {
  const ExplorerCarouselSuccessWidget({
    required this.entity,
    required this.navigator,
    super.key,
  });

  final ExplorerCarouselEntity entity;
  final AppNavigator navigator;

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SomaText(
          text: entity.title,
          type: SomaTypographyType.title1,
        ),
        SizedBox(
          height: tokens.spacings.inline.xs,
        ),
        CarouselSlider.builder(
          itemCount: entity.cards.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            final subtitle = entity.cards[itemIndex].subtitle;
            return Padding(
              padding: EdgeInsets.only(right: tokens.spacings.inline.xs),
              child: CardWidget(
                icon: entity.cards[itemIndex].icon,
                onTap: () {
                  final deeplink = entity.cards[itemIndex].deeplink;
                  if (deeplink != null) {
                    navigator.pushToUrl(
                      Uri.parse(
                        deeplink,
                      ),
                    );
                  }
                },
                title: entity.cards[itemIndex].title,
                subtitle: subtitle,
              ),
            );
          },
          options: CarouselOptions(
            enableInfiniteScroll: false,
            viewportFraction: 0.45,
            padEnds: false,
            initialPage: 0,
            height: MediaQuery.sizeOf(context).height * 0.189,
          ),
        ),
      ],
    );
  }
}
