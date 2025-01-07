import 'package:flutter/material.dart' hide WidgetState;
import 'package:tcc_mobile/app/presentation/home/widgets/explorer_carousel/domain/entity/explorer_carousel_entity.dart';
import 'package:tcc_mobile/app/presentation/home/widgets/explorer_carousel/explorer_carousel_widget.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/soma/soma.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.carouselProvider,
    super.key,
  });

  final WidgetContentCommand<ExplorerCarouselEntity> carouselProvider;

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: tokens.spacings.inline.md,
          horizontal: tokens.spacings.inline.xs,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ExplorerCarouselWidget(
                model: const WidgetModel(
                  id: 'explorer-carousel',
                  path: '/v1/explorer-carousel',
                  state: WidgetState.loading,
                  data: {},
                ),
                provider: carouselProvider,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
