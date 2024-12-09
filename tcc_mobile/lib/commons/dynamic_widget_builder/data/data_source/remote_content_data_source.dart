import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/network/api_data_source_delegate.dart';
import 'package:tcc_mobile/commons/network/data/request_params.dart';
import 'package:tcc_mobile/commons/network/data/request_type.dart';

class RemoteContentDataSource extends ContentDataSource {
  RemoteContentDataSource(
    this._delegate,
  );

  final ApiDataSourceDelegate _delegate;

  @override
  Future<WidgetContentResponse> getContent({
    required WidgetContentRequest request,
  }) async {
    request as WidgetLoadContentRequest;
    return _delegate
        .fetchAsFuture<WidgetContentResponse>(
          params: RequestParams(
            endpoint: request.endpoint,
            requestType: RequestType.getByName(request.method),
            queryParams: request.queryParams,
          ),
          mapper: SuccessResponse.fromData,
        )
        .onError(
          (error, stackTrace) => ErrorResponse(
            error: error,
            stackTrace: stackTrace,
          ),
        );
  }
}
