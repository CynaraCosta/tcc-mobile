import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:tcc_mobile/commons/network/data/request_type.dart';

class RequestParams extends Equatable {
  const RequestParams({
    required this.endpoint,
    required this.savePath,
    required this.requestType,
    required this.body,
    required this.queryParams,
    required this.options,
    required this.successCodes,
    required this.progress,
  });

  final String endpoint;
  final String? savePath;
  final RequestType requestType;
  final dynamic body;
  final Map<String, dynamic>? queryParams;
  final RequestOptions? options;
  final List<int>? successCodes;
  final void Function(int, int)? progress;

  RequestParams copyWith({
    String? endpoint,
    String? savePath,
    RequestType? requestType,
    dynamic body,
    Map<String, dynamic>? queryParams,
    RequestOptions? options,
    List<int>? successCodes,
    void Function(int, int)? progress,
  }) {
    return RequestParams(
      endpoint: endpoint ?? this.endpoint,
      savePath: savePath ?? this.savePath,
      requestType: requestType ?? this.requestType,
      body: body ?? this.body,
      queryParams: queryParams ?? this.queryParams,
      options: options ?? this.options,
      successCodes: successCodes ?? this.successCodes,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object?> get props => [
        endpoint,
        savePath,
        requestType,
        body,
        queryParams,
        options,
        successCodes,
        progress,
      ];
}

class RequestOptions extends Equatable {
  const RequestOptions({
    required this.headers,
    required this.sendTimeout,
    required this.receiveTimeout,
  });

  final Map<String, dynamic>? headers;
  final int? sendTimeout;
  final int? receiveTimeout;

  @override
  List<Object?> get props => [
        headers,
        sendTimeout,
        receiveTimeout,
      ];
}

class RequestUploadParams extends RequestParams {
  RequestUploadParams({
    required super.endpoint,
    required super.progress,
    required String filePath,
    required String fileName,
    super.options,
    super.queryParams,
    super.savePath,
    super.successCodes,
  }) : super(
    requestType: RequestType.post,
    body: FormData.fromMap({
      'file': MultipartFile.fromFileSync(filePath, filename: fileName),
    }),
  );
}
