import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

abstract class ContentDataSource {
  Future<WidgetContentResponse> getContent({
    required WidgetContentRequest request,
  });
}
