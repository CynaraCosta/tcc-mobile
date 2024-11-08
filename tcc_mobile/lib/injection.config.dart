// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tcc_mobile/app_module.dart' as _i965;
import 'package:tcc_mobile/commons/router/router.dart' as _i290;
import 'package:tcc_mobile/commons/router/src/app_navigator.dart' as _i757;

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
    gh.singleton<_i290.AppRouterConfig>(
        () => appModule.providesAppRouterConfig());
    gh.lazySingleton<_i757.AppNavigator>(
        () => _i757.AppNavigatorImpl(gh<_i290.AppRouterConfig>()));
    return this;
  }
}

class _$AppModule extends _i965.AppModule {}
