import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

abstract class ComponentContentAdapter {
  const ComponentContentAdapter({
    required this.builders,
  });

  final HashMap<String, Widget Function(WidgetModel model)> builders;

  Widget bindWidget(WidgetModel model);
}

class ComponentContentAdapterImpl extends ComponentContentAdapter {
  const ComponentContentAdapterImpl({
    required super.builders,
  });

  @override
  Widget bindWidget(WidgetModel model) {
    return builders[model.id]?.call(model) ?? const SizedBox.shrink();
  }
}
