import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/explorer_carousel/domain/entity/explorer_carousel_entity.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/explorer_carousel/presentation/explorer_carousel_widget.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/builder/component_builder.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/helpers/widget_insets_helper.dart';
import 'package:tcc_mobile/commons/router/src/app_navigator.dart';

class ExplorerCarouselBuilder
    implements ComponentBuilder<ExplorerCarouselWidget> {
  ExplorerCarouselBuilder();

  late WidgetContentCommand<ExplorerCarouselEntity> provider;
  late AppNavigator navigator;
  late WidgetInsetsHelper widgetInsetsHelper;

  void addProvider(WidgetContentCommand<ExplorerCarouselEntity> provider) {
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
    return ExplorerCarouselWidget(
      model: model,
      provider: provider,
      navigator: navigator,
      widgetInsetsHelper: widgetInsetsHelper,
    );
  }
}
