import 'package:flutter/material.dart' hide WidgetState;
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/explorer_carousel/domain/entity/explorer_carousel_entity.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/explorer_carousel/explorer_carousel_widget.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/history_cards/domain/entity/history_cards_entity.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/history_cards/history_cards_widget.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/router/src/app_navigator.dart';
import 'package:tcc_mobile/soma/soma.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.carouselProvider,
    required this.historyProvider,
    required this.navigator,
    super.key,
  });

  final WidgetContentCommand<ExplorerCarouselEntity> carouselProvider;
  final WidgetContentCommand<HistoryCardsEntity> historyProvider;
  final AppNavigator navigator;

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: tokens.spacings.inline.md,
          horizontal: tokens.spacings.inline.xs,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoImageWidget(),
              ExplorerCarouselWidget(
                model: const WidgetModel(
                  id: 'explorer-carousel',
                  path: '/v1/explorer-carousel',
                  state: WidgetState.loading,
                  data: {},
                ),
                provider: carouselProvider,
                navigator: navigator,
              ),
              SizedBox(
                height: tokens.spacings.inline.md,
              ),
              HistoryCardsWidget(
                model: const WidgetModel(
                  id: 'history-cards',
                  path: '/v1/history-cards',
                  state: WidgetState.loading,
                  data: {},
                ),
                provider: historyProvider,
                navigator: navigator,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
