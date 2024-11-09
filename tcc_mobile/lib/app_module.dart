import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/page_routes.dart';
import 'package:tcc_mobile/soma/soma.dart';

@module
abstract class AppModule {
  @injectable
  SomaThemeData get coreTheme => CoreSomaThemeData();

  @singleton
  AppRouterConfig providesAppRouterConfig() => AppRouterConfig(
        routes: routes,
      );
}
