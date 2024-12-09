import 'package:equatable/equatable.dart';

abstract class WidgetContentRequest extends Equatable {
  const WidgetContentRequest();
}

class WidgetLoadContentRequest extends WidgetContentRequest {
  const WidgetLoadContentRequest(
    {
      required this.endpoint,
      this.method = 'get',
      this.queryParams,
    }
  );

  final String endpoint;
  final String method;
  final Map<String, dynamic>? queryParams;

  @override
  List<Object?> get props => [
    endpoint,
    method,
    queryParams,
  ];
}
