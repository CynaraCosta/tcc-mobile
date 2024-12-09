import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

class GetContentCommandDefault<T> extends WidgetContentCommand<T> {
  GetContentCommandDefault(
    this._mapper,
    this._requestMapper,
    this._strategy,
  );

  final WidgetContentMapper<T> _mapper;
  final WidgetContentRequestMapper _requestMapper;
  final WidgetContentStrategy _strategy;

  @override
  Future<T> execute(WidgetEvent event) async {
    final request = _requestMapper.mapToRequest(event);
    return await _strategy.execute(event, request).then((response) {
      if (response is SuccessResponse) {
        return _mapper.mapToContent(response.data);
      } else if (response is ErrorResponse) {
        throw response;
      } else {
        throw UnimplementedError('Unknown response type');
      }
    });
  }
}
