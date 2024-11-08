import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/commons/router/di/router_module.config.dart';
import 'package:tcc_mobile/commons/router/router.dart';

@InjectableInit(initializerName: r'$initRouterGetIt')
Future<void> configureRouterDependencies(
  GetIt getIt,
  List<PageRoute> routes,
) async {
  getIt.$initRouterGetIt();

  getIt.registerLazySingleton<AppRouterConfig>(
      () => AppRouterConfig(routes: routes));
}
