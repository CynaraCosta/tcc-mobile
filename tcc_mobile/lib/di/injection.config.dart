// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tcc_mobile/commons/debugging/features/network/data/repository/shared_preferences_repository.dart'
    as _i792;
import 'package:tcc_mobile/commons/debugging/features/network/di/network_di_module.dart'
    as _i769;
import 'package:tcc_mobile/commons/router/router.dart' as _i290;
import 'package:tcc_mobile/commons/router/src/app_navigator.dart' as _i757;
import 'package:tcc_mobile/di/app_module.dart' as _i700;
import 'package:tcc_mobile/soma/soma.dart' as _i566;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    final networkDiModule = _$NetworkDiModule();
    gh.factory<_i566.SomaThemeData>(() => appModule.coreTheme);
    gh.factory<_i792.SharedPreferencesRepository>(
        () => networkDiModule.repository);
    gh.singleton<_i290.AppRouterConfig>(
        () => appModule.providesAppRouterConfig());
    gh.lazySingleton<_i757.AppNavigator>(
        () => _i757.AppNavigatorImpl(gh<_i290.AppRouterConfig>()));
    return this;
  }
}

class _$AppModule extends _i700.AppModule {}

class _$NetworkDiModule extends _i769.NetworkDiModule {}
