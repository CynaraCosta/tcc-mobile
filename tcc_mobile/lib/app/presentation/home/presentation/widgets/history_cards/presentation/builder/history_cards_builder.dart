import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/history_cards/domain/entity/history_cards_entity.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/history_cards/presentation/history_cards_widget.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/builder/component_builder.dart';
import 'package:tcc_mobile/commons/router/router.dart';

class HistoryCardsBuilder implements ComponentBuilder<HistoryCardsWidget> {
  HistoryCardsBuilder({
    required this.provider,
  });

  final WidgetContentCommand<HistoryCardsEntity> provider;
  late AppNavigator navigator;

  void addNavigator(AppNavigator navigator) {
    this.navigator = navigator;
  }

  @override
  Widget create(WidgetModel model) {
    return HistoryCardsWidget(
      model: model,
      provider: provider,
      navigator: navigator,
    );
  }
}
