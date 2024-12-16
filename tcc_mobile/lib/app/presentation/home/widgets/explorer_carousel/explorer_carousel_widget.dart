import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'domain/entity/explorer_carousel_entity.dart';
import 'widgets/explorer_carousel_error_widget.dart';
import 'widgets/explorer_carousel_loading_widget.dart';
import 'widgets/explorer_carousel_success_widget.dart';

class ExplorerCarouselWidget extends StatelessWidget {
  const ExplorerCarouselWidget({
    required this.model,
    required this.provider,
    super.key,
  });

  final WidgetModel model;
  final WidgetContentCommand<ExplorerCarouselEntity> provider;

  @override
  Widget build(BuildContext context) {
    final onRetryAction = OnRetryAction();
    return DynamicFutureWidgetBuilder<ExplorerCarouselEntity,
        WidgetContentCommand<ExplorerCarouselEntity>>(
      provider: provider,
      modelBuilder: (provider) => provider.execute(
        WidgetGetContentEvent(content: model),
      ),
      successBuilder: (buildContenxt, entity) =>
          ExplorerCarouselSuccessWidget(entity: entity),
      errorBuilder: (buildContenxt, error, stackTrace) =>
          ExplorerCarouselErrorWidget(
        onTapError: onRetryAction.call,
      ),
      loadingBuilder: (buildContenxt) => const ExplorerCarouselLoadingWidget(),
      onRetryAction: onRetryAction,
    );
  }
}
