import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

class ContentRepositoryDefault extends WidgetContentRepository {
  ContentRepositoryDefault(this._dataSource);

  final ContentDataSource _dataSource;

  @override
  Future<WidgetContentResponse> getContent(WidgetContentRequest request) {
    return _dataSource.getContent(request: request);
  }
}
