import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/page_routes.dart';

@module
abstract class AppModule {
  @singleton
  AppRouterConfig providesAppRouterConfig() => AppRouterConfig(
        routes: routes,
      );
}
