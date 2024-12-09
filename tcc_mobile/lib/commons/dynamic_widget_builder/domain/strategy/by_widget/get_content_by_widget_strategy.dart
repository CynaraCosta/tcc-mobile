import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

abstract class GetContentByWidgetStrategy {
  bool isApplicable(WidgetModel model);
  Future<WidgetContentResponse> execute(
    WidgetModel model,
    WidgetContentRequest request,
  );
}
