import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

abstract class WidgetContentStrategy {
  Future<WidgetContentResponse> execute(
    WidgetEvent event,
    WidgetContentRequest request,
  );
}
