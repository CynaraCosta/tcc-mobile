import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

class GetContentByWidgetDataStrategy extends GetContentByWidgetStrategy {
  @override
  Future<WidgetContentResponse> execute(
    WidgetModel model,
    WidgetContentRequest request,
  ) async {
    return SuccessResponse(data: model.data);
  }

  @override
  bool isApplicable(WidgetModel model) {
    return model.state == WidgetState.success;
  }
}
