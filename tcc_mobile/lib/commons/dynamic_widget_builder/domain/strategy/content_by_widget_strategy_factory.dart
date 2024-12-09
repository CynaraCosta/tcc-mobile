import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

abstract class ContentByWidgetStrategyFactory {
  void addStrategy(GetContentByWidgetStrategy strategy);
  WidgetContentStrategy create();
}

class DefaultContentByWidgetStrategyFactory
    extends ContentByWidgetStrategyFactory {
  final Set<GetContentByWidgetStrategy> _strategies = {};

  @override
  void addStrategy(GetContentByWidgetStrategy strategy) {
    _strategies.add(strategy);
  }

  @override
  WidgetContentStrategy create() {
    return ContentByWidgetStrategy(_strategies);
  }
}
