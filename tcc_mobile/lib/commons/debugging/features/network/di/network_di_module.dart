import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/data_source/no_op_data_source.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/data_source/shared_preferences_data_source.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/factory/api_response_factory.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/repository/shared_preferences_repository.dart';

@module
abstract class NetworkDiModule {
  @injectable
  String get _kNetworkSharedPreferencesKey => 'debuggingNetwork';

  ApiResponseFactory get _apiResponseFactory => ApiResponseFactory();

  SharedPreferencesDataSource get _dataSource => SharedPreferencesDataSource(
        factory: _apiResponseFactory,
        preferenceKey: _kNetworkSharedPreferencesKey,
      );

  NoOpDataSource get _noOpDataSource => NoOpDataSource();

  SharedPreferencesRepository get repository => SharedPreferencesRepositoryImpl(
        _dataSource,
        _noOpDataSource,
      );
}
