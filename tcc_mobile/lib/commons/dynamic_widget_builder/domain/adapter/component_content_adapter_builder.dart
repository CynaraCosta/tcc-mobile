import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

abstract class ComponentContentAdapterBuilder {
  abstract HashMap<String, Widget Function(WidgetModel model)> builders;

  void addBuilder(String name, Widget Function(WidgetModel model) builder) {
    builders[name] = builder;
  }

  ComponentContentAdapter build();
}

class ComponentContentAdapterBuilderImpl
    extends ComponentContentAdapterBuilder {
  ComponentContentAdapterBuilderImpl();
  @override
  HashMap<String, Widget Function(WidgetModel model)> builders = HashMap();

  @override
  ComponentContentAdapter build() =>
      ComponentContentAdapterImpl(builders: builders);
}
