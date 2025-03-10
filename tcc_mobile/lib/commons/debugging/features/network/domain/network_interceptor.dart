// ignore_for_file: unused_element, avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/models/api_response_model.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/repository/shared_preferences_repository.dart';
import 'package:tcc_mobile/commons/debugging/settings/debugging_settings.dart';

class NetworkInterceptor extends Interceptor {
  NetworkInterceptor();

  final SharedPreferencesRepository _repository =
      GetIt.I.get<SharedPreferencesRepository>();
  late DateTime _requestTime;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // _logRequest(options);
    _requestTime = DateTime.now();
    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (DebuggingSettings.enabled) {
      await _saveResponse(
        response,
        _cURLRepresentation(response.requestOptions),
      );
    }
    // _logResponse(response);
    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (DebuggingSettings.enabled) {
      await _saveError(err, _cURLRepresentation(err.requestOptions));
    }
    // _logError(err);
    handler.next(err);
  }

  Future<void> _saveResponse(Response<dynamic> response, String curl) async {
    try {
      await _repository.save(
        ApiResponseModel(
          body: response.data,
          baseUrl: response.requestOptions.baseUrl,
          path: response.requestOptions.path,
          method: response.requestOptions.method,
          statusCode: response.statusCode ?? -1,
          connectionTimeout:
              response.requestOptions.connectTimeout?.inSeconds ?? 0,
          contentType: response.requestOptions.contentType,
          queryParameters: response.requestOptions.queryParameters.toString(),
          receiveTimeout:
              response.requestOptions.receiveTimeout?.inSeconds ?? 0,
          request: _separateFileObjects(response.requestOptions).data,
          requestTime: _requestTime,
          responseTime: DateTime.now(),
          responseType: response.requestOptions.responseType.name,
          sendTimeout: response.requestOptions.sendTimeout?.inSeconds ?? 0,
          curl: curl,
          headers: response.headers.map,
        ),
      );
    } catch (_) {}
  }

  Future<void> _saveError(DioException response, String curl) async {
    try {
      await _repository.save(
        ApiResponseModel(
          body: _getJson(response.response.toString()),
          baseUrl: response.requestOptions.baseUrl,
          path: response.requestOptions.path,
          method: response.requestOptions.method,
          statusCode: response.response?.statusCode ?? -1,
          connectionTimeout:
              response.requestOptions.connectTimeout?.inSeconds ?? 0,
          contentType: response.requestOptions.contentType,
          queryParameters: response.requestOptions.queryParameters.toString(),
          receiveTimeout:
              response.requestOptions.receiveTimeout?.inSeconds ?? 0,
          request: _separateFileObjects(response.requestOptions).data,
          requestTime: _requestTime,
          responseTime: DateTime.now(),
          responseType: response.requestOptions.responseType.name,
          sendTimeout: response.requestOptions.sendTimeout?.inSeconds ?? 0,
          curl: curl,
          headers: response.response?.headers.map ?? {},
        ),
      );
    } catch (_) {}
  }

  Map<String, dynamic> _getJson(String data) {
    try {
      return jsonDecode(data) as Map<String, dynamic>;
    } catch (_) {
      return {};
    }
  }

  RequestOptions _separateFileObjects(RequestOptions request) {
    if (request.data is! FormData) {
      return request;
    }

    final formData = request.data as FormData;
    final formFields = formData.fields.map((e) => {e.key: e.value}).toList()
      ..addAll(formData.files.map((e) => {e.key: e.value.filename ?? ''}));
    return RequestOptions(path: request.path, data: formFields);
  }

  String _cURLRepresentation(RequestOptions options) {
    final List<String> curl = ['curl -i'];
    if (options.method.toUpperCase() != 'GET') {
      curl.add('-X ${options.method}');
    }

    options.headers.forEach((key, value) {
      if (key != 'Cookie') {
        curl.add('-H "$key: $value"');
      }
    });

    if (options.data != null) {
      if (options.data is FormData) {
        options.data = Map.fromEntries(options.data.fields);
      }
      final data = json.encode(options.data).replaceAll('"', '\\"');
      curl.add('-d "$data"');
    }
    curl.add('"${options.uri.toString()}"');
    return curl.join(' \\\n\t');
  }

  void _logRequest(RequestOptions options) {
    print(
      '\n*** Request ***\n'
      'URL: ${options.baseUrl}${options.path}\n'
      'Method: ${options.method}\n'
      'Headers: ${jsonEncode(options.headers)}\n'
      'Query Parameters: ${jsonEncode(options.queryParameters)}\n'
      'Body: ${options.data != null ? jsonEncode(options.data) : 'No Body'}\n'
      '*** End of Request ***\n',
    );
  }

  void _logResponse(Response<dynamic> response) {
    print(
      '\n*** Response ***\n'
      'URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}\n'
      'Status Code: ${response.statusCode}\n'
      'Headers: ${jsonEncode(response.headers.map)}\n'
      'Body: ${response.data != null ? jsonEncode(response.data) : 'No Body'}\n'
      '*** End of Response ***\n',
    );
  }

  void _logError(DioException err) {
    print(
      '\n*** Error ***\n'
      'URL: ${err.requestOptions.baseUrl}${err.requestOptions.path}\n'
      'Status Code: ${err.response?.statusCode ?? 'Unknown'}\n'
      'Error: ${err.message}\n'
      // ignore: lines_longer_than_80_chars
      'Body: ${err.response?.data != null ? jsonEncode(err.response?.data) : 'No Body'}\n'
      '*** End of Error ***\n',
    );
  }
}
