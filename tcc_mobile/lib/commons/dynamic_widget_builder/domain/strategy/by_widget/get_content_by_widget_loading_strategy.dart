import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

class GetContentByWidgetLoadingStrategy extends GetContentByWidgetStrategy {
  GetContentByWidgetLoadingStrategy(
    this._repository,
  );

  final WidgetContentRepository _repository;

  @override
  Future<WidgetContentResponse> execute(
    WidgetModel model,
    WidgetContentRequest request,
  ) {
    return _repository.getContent(request);
  }

  @override
  bool isApplicable(WidgetModel model) {
    return model.state == WidgetState.loading;
  }
}
