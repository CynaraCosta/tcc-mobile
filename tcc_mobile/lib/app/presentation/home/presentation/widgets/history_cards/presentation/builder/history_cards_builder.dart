import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/history_cards/domain/entity/history_cards_entity.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/history_cards/presentation/history_cards_widget.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/builder/component_builder.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/helpers/widget_insets_helper.dart';
import 'package:tcc_mobile/commons/router/router.dart';

class HistoryCardsBuilder implements ComponentBuilder<HistoryCardsWidget> {
  HistoryCardsBuilder();

  late WidgetContentCommand<HistoryCardsEntity> provider;
  late AppNavigator navigator;
  late WidgetInsetsHelper widgetInsetsHelper;

  void addProvider(WidgetContentCommand<HistoryCardsEntity> provider) {
    this.provider = provider;
  }

  void addNavigator(AppNavigator navigator) {
    this.navigator = navigator;
  }

  void addWidgetInsetsHelper(WidgetInsetsHelper widgetInsetsHelper) {
    this.widgetInsetsHelper = widgetInsetsHelper;
  }

  @override
  Widget create(WidgetModel model) {
    return HistoryCardsWidget(
      model: model,
      provider: provider,
      navigator: navigator,
      widgetInsetsHelper: widgetInsetsHelper,
    );
  }
}
