import 'package:equatable/equatable.dart';

abstract class WidgetContentResponse extends Equatable {
  const WidgetContentResponse();
}

class SuccessResponse extends WidgetContentResponse {
  const SuccessResponse({
    required this.data,
  });

  factory SuccessResponse.fromData(dynamic data) {
    return SuccessResponse(data: data);
  }

  final dynamic data;

  @override
  List<Object?> get props => [data];
}

class ErrorResponse extends WidgetContentResponse {
  const ErrorResponse({
    required this.error,
    required this.stackTrace,
  });

  final Object? error;
  final StackTrace stackTrace;

  @override
  List<Object?> get props => [
        error,
        stackTrace,
      ];
}
