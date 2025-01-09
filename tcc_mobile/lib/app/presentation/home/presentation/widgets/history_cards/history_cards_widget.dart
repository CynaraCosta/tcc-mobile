import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'domain/entity/history_cards_entity.dart';
import 'widgets/history_cards_error_widget.dart';
import 'widgets/history_cards_loading_widget.dart';
import 'widgets/history_cards_success_widget.dart';

class HistoryCardsWidget extends StatelessWidget {
  const HistoryCardsWidget({
    required this.model,
    required this.provider,
    required this.navigator,
    super.key,
  });

  final WidgetModel model;
  final WidgetContentCommand<HistoryCardsEntity> provider;
  final AppNavigator navigator;

  @override
  Widget build(BuildContext context) {
    final onRetryAction = OnRetryAction();
    return DynamicFutureWidgetBuilder<HistoryCardsEntity,
        WidgetContentCommand<HistoryCardsEntity>>(
      provider: provider,
      modelBuilder: (provider) => provider.execute(
        WidgetGetContentEvent(content: model),
      ),
      successBuilder: (buildContenxt, entity) => HistoryCardsSuccessWidget(
        entity: entity,
        navigator: navigator,
      ),
      errorBuilder: (buildContenxt, error, stackTrace) =>
          HistoryCardsErrorWidget(
        onTapError: onRetryAction.call,
      ),
      loadingBuilder: (buildContenxt) => const HistoryCardsLoadingWidget(),
      onRetryAction: onRetryAction,
    );
  }
}
