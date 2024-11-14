import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/commons/debugging/features/network/domain/network_interceptor.dart';
import 'package:tcc_mobile/commons/network/api_data_source_delegate.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseUrl => 'https://jsonplaceholder.typicode.com';

  @Named('NetworkInterceptor')
  Interceptor providePrettyLogger() => GetIt.I.get<NetworkInterceptor>();

  @singleton
  Dio provideDio(
    @Named('BaseUrl') String baseUrl,
    @Named('NetworkInterceptor') Interceptor networkInterceptor,
  ) =>
      Dio(
        BaseOptions(baseUrl: baseUrl),
      )..interceptors.add(networkInterceptor);

  ApiDataSourceDelegate providesApiDataSourceDelegate() =>
      ApiDataSourceDelegateImpl(
        dio: GetIt.I.get<Dio>(),
      );
}
