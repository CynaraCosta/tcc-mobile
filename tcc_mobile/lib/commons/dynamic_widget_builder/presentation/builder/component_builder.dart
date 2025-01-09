import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

abstract class ComponentBuilder<T extends Widget> {
  Widget create(WidgetModel model);
}
