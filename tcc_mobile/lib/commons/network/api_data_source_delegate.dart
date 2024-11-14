import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tcc_mobile/commons/network/data/request_params.dart';
import 'package:tcc_mobile/commons/network/data/request_type.dart';
import 'package:tcc_mobile/commons/network/domain/api_delegate_exception.dart';
import 'package:tcc_mobile/commons/network/domain/http_exception_delegate.dart';

abstract class ApiDataSourceDelegate {
  Future<S> fetchAsFuture<S>({
    required RequestParams params,
    required S Function(dynamic) mapper,
  });
}

class ApiDataSourceDelegateImpl implements ApiDataSourceDelegate {
  ApiDataSourceDelegateImpl({
    required this.dio,
  });

  final Dio dio;
  static const defaultTimeout = Duration(milliseconds: 30000);

  @override
  Future<S> fetchAsFuture<S>({
    required RequestParams params,
    required S Function(dynamic p1) mapper,
  }) {
    return _getResponse(params)
        .then((response) => mapper(response.data))
        .catchError((error) => throw _handleError(error));
  }

  Future<Response> _getResponse(RequestParams params) async {
    dio.options = dio.options.copyWith(
      sendTimeout: defaultTimeout,
      connectTimeout: defaultTimeout,
      receiveTimeout: defaultTimeout,
    );
    final response = await _makeRequest(params);
    _checkStatusCode(params, response.statusCode);
    return response;
  }

  Future<Response> _makeRequest(RequestParams params) async {
    final sendTimeout = (params.options?.sendTimeout != null)
        ? Duration(seconds: params.options!.sendTimeout!)
        : null;

    final receiveTimeout = (params.options?.receiveTimeout != null)
        ? Duration(seconds: params.options!.receiveTimeout!)
        : null;

    switch (params.requestType) {
      case RequestType.get:
        return await dio.get(
          params.endpoint,
          data: params.body,
          queryParameters: params.queryParams,
          options: params.options != null
              ? Options(
                  headers: params.options?.headers,
                  sendTimeout: sendTimeout,
                  receiveTimeout: receiveTimeout,
                )
              : null,
        );
      case RequestType.post:
        return await dio.post(
          params.endpoint,
          data: params.body,
          queryParameters: params.queryParams,
          onSendProgress: params.progress,
          options: params.options != null
              ? Options(
                  headers: params.options?.headers,
                  sendTimeout: sendTimeout,
                  receiveTimeout: receiveTimeout,
                )
              : null,
        );
      case RequestType.put:
        return await dio.put(
          params.endpoint,
          data: params.body,
          queryParameters: params.queryParams,
          options: params.options != null
              ? Options(
                  headers: params.options?.headers,
                  sendTimeout: sendTimeout,
                  receiveTimeout: receiveTimeout,
                )
              : null,
        );
      case RequestType.delete:
        return await dio.delete(
          params.endpoint,
          data: params.body,
          queryParameters: params.queryParams,
          options: params.options != null
              ? Options(
                  headers: params.options?.headers,
                  sendTimeout: sendTimeout,
                  receiveTimeout: receiveTimeout,
                )
              : null,
        );
      case RequestType.patch:
        return await dio.patch(
          params.endpoint,
          data: params.body,
          queryParameters: params.queryParams,
          options: params.options != null
              ? Options(
                  headers: params.options?.headers,
                  sendTimeout: sendTimeout,
                  receiveTimeout: receiveTimeout,
                )
              : null,
        );
      case RequestType.download:
        return await dio.download(
          params.endpoint,
          params.savePath,
          data: params.body,
          queryParameters: params.queryParams,
          options: params.options != null
              ? Options(
                  headers: params.options?.headers,
                  sendTimeout: sendTimeout,
                  receiveTimeout: receiveTimeout,
                )
              : null,
        );
    }
  }

  void _checkStatusCode(RequestParams params, int? statusCode) {
    if (params.successCodes == null) return;
    if (params.successCodes?.contains(statusCode) == false) {
      throw HttpExceptionDelegate(
        '$statusCode is not a success code defined by request params',
        statusCode: statusCode,
      );
    }
  }

  Object _handleError(Object error) {
    if (error is DioException) {
      if (error.error is SocketException) {
        return ClientNetworkException(error.stackTrace);
      } else {
        if (error.response?.statusCode == 401) {
          return SessionExpiredException(error.stackTrace);
        } else {
          return ApiNetworkException(
            stackTrace: error.stackTrace,
            statusCode: error.response?.statusCode,
            statusMessage: error.response?.statusMessage,
            data: error.response?.data,
            endpoint: error.requestOptions.path,
          );
        }
      }
    } else {
      return error;
    }
  }
}
