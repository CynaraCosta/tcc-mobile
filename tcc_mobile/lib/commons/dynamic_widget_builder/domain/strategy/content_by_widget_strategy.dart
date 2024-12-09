import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

class ContentByWidgetStrategy extends WidgetContentStrategy {
  ContentByWidgetStrategy(
    this._strategies,
  );

  final Set<GetContentByWidgetStrategy> _strategies;

  @override
  Future<WidgetContentResponse> execute(
    WidgetEvent event,
    WidgetContentRequest request,
  ) async {
    event as WidgetGetContentEvent;
    final resolver = _getStrategy(event);
    if (resolver != null) {
      return await resolver.execute(event.content, request);
    }

    throw UnimplementedError('Strategy is required');
  }

  GetContentByWidgetStrategy? _getStrategy(WidgetGetContentEvent event) {
    GetContentByWidgetStrategy? resolver;
    for (GetContentByWidgetStrategy element in _strategies) {
      if (element.isApplicable(event.content)) {
        resolver = element;
        break;
      }
    }
    return resolver;
  }
}
