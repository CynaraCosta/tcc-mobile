import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

class GetContentByWidgetErrorStrategy extends GetContentByWidgetStrategy {
  @override
  Future<WidgetContentResponse> execute(
    WidgetModel model,
    WidgetContentRequest request,
  ) async {
    return const ErrorResponse(
      error: null,
      stackTrace: StackTrace.empty,
    );
  }

  @override
  bool isApplicable(WidgetModel model) {
    return model.state == WidgetState.error;
  }
}
