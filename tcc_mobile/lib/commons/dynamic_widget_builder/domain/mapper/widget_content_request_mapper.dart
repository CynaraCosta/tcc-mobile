import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

class WidgetLoadContentRequestMapper extends WidgetContentRequestMapper {
  @override
  WidgetContentRequest mapToRequest(WidgetEvent event) {
    if (event is WidgetGetContentEvent) {
      return WidgetLoadContentRequest(endpoint: event.content.path ?? '');
    } else {
      throw UnimplementedError('Unknown mapper type');
    }
  }
}
