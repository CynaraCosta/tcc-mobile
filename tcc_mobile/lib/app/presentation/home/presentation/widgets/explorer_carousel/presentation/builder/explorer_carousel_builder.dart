import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/explorer_carousel/domain/entity/explorer_carousel_entity.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/explorer_carousel/presentation/explorer_carousel_widget.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/builder/component_builder.dart';
import 'package:tcc_mobile/commons/router/src/app_navigator.dart';

class ExplorerCarouselBuilder
    implements ComponentBuilder<ExplorerCarouselWidget> {
  ExplorerCarouselBuilder({
    required this.provider,
  });

  final WidgetContentCommand<ExplorerCarouselEntity> provider;
  late AppNavigator navigator;

  void addNavigator(AppNavigator navigator) {
    this.navigator = navigator;
  }

  @override
  Widget create(WidgetModel model) {
    return ExplorerCarouselWidget(
      model: model,
      provider: provider,
      navigator: navigator,
    );
  }
}
