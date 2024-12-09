import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

class GetContentByWidgetLoadingStrategy extends GetContentByWidgetStrategy {
  @override
  Future<WidgetContentResponse> execute(
    WidgetModel model,
    WidgetContentRequest request,
  ) {
    throw UnimplementedError('repository.getContent');
  }

  @override
  bool isApplicable(WidgetModel model) {
    return model.state == WidgetState.loading;
  }
}
