import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/helpers/widget_insets_helper.dart';
import 'package:tcc_mobile/commons/router/src/app_navigator.dart';
import 'package:tcc_mobile/soma/soma.dart';
import '../domain/entity/explorer_carousel_entity.dart';
import 'widgets/explorer_carousel_error_widget.dart';
import 'widgets/explorer_carousel_loading_widget.dart';
import 'widgets/explorer_carousel_success_widget.dart';

class ExplorerCarouselWidget extends StatelessWidget {
  const ExplorerCarouselWidget({
    required this.model,
    required this.provider,
    required this.navigator,
    required this.widgetInsetsHelper,
    super.key,
  });

  final WidgetModel model;
  final WidgetContentCommand<ExplorerCarouselEntity> provider;
  final AppNavigator navigator;
  final WidgetInsetsHelper widgetInsetsHelper;

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);
    final insets = widgetInsetsHelper.defineWidgetInsets(tokens, model);
    final onRetryAction = OnRetryAction();
    return Padding(
      padding: insets,
      child: DynamicFutureWidgetBuilder<ExplorerCarouselEntity,
          WidgetContentCommand<ExplorerCarouselEntity>>(
        provider: provider,
        modelBuilder: (provider) => provider.execute(
          WidgetGetContentEvent(content: model),
        ),
        successBuilder: (buildContenxt, entity) =>
            ExplorerCarouselSuccessWidget(
          entity: entity,
          navigator: navigator,
        ),
        errorBuilder: (buildContenxt, error, stackTrace) =>
            ExplorerCarouselErrorWidget(
          onTapError: onRetryAction.call,
        ),
        loadingBuilder: (buildContenxt) =>
            const ExplorerCarouselLoadingWidget(),
        onRetryAction: onRetryAction,
      ),
    );
  }
}
