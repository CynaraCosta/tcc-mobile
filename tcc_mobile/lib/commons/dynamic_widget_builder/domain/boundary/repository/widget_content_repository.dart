import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

abstract class WidgetContentRepository {
  Future<WidgetContentResponse> getContent(
    WidgetContentRequest request,
  );
}
