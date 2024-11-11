import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/models/debugging_model.dart';

class ApiResponseModel extends Equatable implements DebuggingModel {
  const ApiResponseModel({
    required this.body,
    required this.baseUrl,
    required this.path,
    required this.method,
    required this.statusCode,
    required this.connectionTimeout,
    required this.contentType,
    required this.queryParameters,
    required this.receiveTimeout,
    required this.request,
    required this.requestTime,
    required this.responseTime,
    required this.responseType,
    required this.sendTimeout,
    required this.curl,
    required this.headers,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      body: json['body'],
      baseUrl: json['baseUrl'],
      path: json['path'],
      method: json['method'],
      statusCode: json['statusCode'],
      connectionTimeout: json['connectionTimeout'],
      contentType: json['contentType'],
      queryParameters: json['queryParameters'],
      receiveTimeout: json['receiveTimeout'],
      request: json['request'],
      requestTime: json['requestTime'],
      responseTime: json['responseTime'],
      responseType: json['responseType'],
      sendTimeout: json['sendTimeout'],
      curl: json['curl'],
      headers: json['headers'],
    );
  }

  final DateTime requestTime;
  final DateTime responseTime;
  final String baseUrl;
  final String path;
  final String method;
  final int statusCode;
  final dynamic request;
  final dynamic body;
  final String? contentType;
  final int sendTimeout;
  final String responseType;
  final int receiveTimeout;
  final String queryParameters;
  final int connectionTimeout;
  final String curl;
  final Map<String, dynamic> headers;

  Map<String, dynamic> toJson() {
    return {
      'requestTime': requestTime.toIso8601String(),
      'responseTime': responseTime.toIso8601String(),
      'baseUrl': baseUrl,
      'path': path,
      'method': method,
      'statusCode': statusCode,
      'request': request,
      'body': body,
      'contentType': contentType,
      'sendTimeout': sendTimeout,
      'responseType': responseType,
      'receiveTimeout': receiveTimeout,
      'queryParameters': queryParameters,
      'connectionTimeout': connectionTimeout,
      'curl': curl,
      'headers': headers,
    };
  }

  ApiResponseModel copyWith({
    DateTime? requestTime,
    DateTime? responseTime,
    String? baseUrl,
    String? path,
    String? method,
    int? statusCode,
    dynamic request,
    dynamic body,
    String? contentType,
    int? sendTimeout,
    String? responseType,
    int? receiveTimeout,
    String? queryParameters,
    int? connectionTimeout,
    String? curl,
    Map<String, dynamic>? headers,
  }) {
    return ApiResponseModel(
      requestTime: requestTime ?? this.requestTime,
      responseTime: responseTime ?? this.responseTime,
      baseUrl: baseUrl ?? this.baseUrl,
      path: path ?? this.path,
      method: method ?? this.method,
      statusCode: statusCode ?? this.statusCode,
      request: request ?? this.request,
      body: body ?? this.body,
      contentType: contentType ?? this.contentType,
      sendTimeout: sendTimeout ?? this.sendTimeout,
      responseType: responseType ?? this.responseType,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      queryParameters: queryParameters ?? this.queryParameters,
      connectionTimeout: connectionTimeout ?? this.connectionTimeout,
      curl: curl ?? this.curl,
      headers: headers ?? this.headers,
    );
  }

  String get prettyJson {
    if (body == null) {
      return '';
    }

    return const JsonEncoder.withIndent('  ').convert(body);
  }
  
  String get prettyJsonRequest {
    if (request == null) {
      return '';
    }

    return const JsonEncoder.withIndent('  ').convert(request);
  }

  @override
  int compareTo(DebuggingModel other) {
    return requestTime.compareTo(
      (other as ApiResponseModel).requestTime,
    );
  }

  @override
  List<Object?> get props => [
        body,
        baseUrl,
        path,
        method,
        statusCode,
        connectionTimeout,
        contentType,
        queryParameters,
        receiveTimeout,
        request,
        requestTime,
        responseTime,
        responseType,
        sendTimeout,
        curl,
        headers,
      ];
}
