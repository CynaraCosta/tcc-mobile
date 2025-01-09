// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/explorer_carousel/di/explorer_carousel_module.dart'
    as _i552;
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/history_cards/di/history_cards_module.dart'
    as _i175;
import 'package:tcc_mobile/commons/debugging/features/network/data/repository/shared_preferences_repository.dart'
    as _i792;
import 'package:tcc_mobile/commons/debugging/features/network/di/network_di_module.dart'
    as _i769;
import 'package:tcc_mobile/commons/debugging/features/network/domain/network_interceptor.dart'
    as _i599;
import 'package:tcc_mobile/commons/debugging/features/network/presentation/bloc/network_requests_cubit.dart'
    as _i113;
import 'package:tcc_mobile/commons/network/api_data_source_delegate.dart'
    as _i1064;
import 'package:tcc_mobile/commons/network/network_module.dart' as _i981;
import 'package:tcc_mobile/commons/router/router.dart' as _i290;
import 'package:tcc_mobile/commons/router/src/app_navigator.dart' as _i757;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i552.ExplorerCarouselModule().init(gh);
    await _i175.HistoryCardsModule().init(gh);
    final networkDiModule = _$NetworkDiModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i792.SharedPreferencesRepository>(
        () => networkDiModule.repository);
    gh.factory<_i599.NetworkInterceptor>(
        () => networkDiModule.providesNetworkInterceptor());
    gh.factory<_i113.NetworkRequestsCubit>(
        () => networkDiModule.providesNetworkRequestsCubit());
    gh.factory<_i1064.ApiDataSourceDelegate>(
        () => networkModule.providesApiDataSourceDelegate());
    gh.factory<String>(
      () => networkModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i361.Interceptor>(
      () => networkModule.providePrettyLogger(),
      instanceName: 'NetworkInterceptor',
    );
    gh.singleton<_i361.Dio>(() => networkModule.provideDio(
          gh<String>(instanceName: 'BaseUrl'),
          gh<_i361.Interceptor>(instanceName: 'NetworkInterceptor'),
        ));
    gh.lazySingleton<_i757.AppNavigator>(
        () => _i757.AppNavigatorImpl(gh<_i290.AppRouterConfig>()));
    return this;
  }
}

class _$NetworkDiModule extends _i769.NetworkDiModule {}

class _$NetworkModule extends _i981.NetworkModule {}
