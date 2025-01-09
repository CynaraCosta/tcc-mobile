import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

abstract class ComponentsPageFactory {
  ComponentsPageFactory();
  late ComponentContentAdapter adapter;
  void addAdapter(ComponentContentAdapter adapter);
  Widget create([dynamic params]);
}
