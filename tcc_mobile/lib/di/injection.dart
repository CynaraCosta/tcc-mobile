import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/explorer_carousel/di/explorer_carousel_module.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/history_cards/di/history_cards_module.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/helpers/widget_insets_helper.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/di/injection.config.dart';
import 'package:tcc_mobile/page_routes.dart';
import 'package:tcc_mobile/soma/soma.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(ExplorerCarouselModule),
    ExternalModule(HistoryCardsModule),
  ],
)
Future<void> configureDependencies() async {
  getIt.init();

  getIt.registerLazySingleton<AppRouterConfig>(
    () => AppRouterConfig(
      routes: routes,
    ),
  );

  getIt.registerFactory<SomaThemeData>(
    () => CoreSomaThemeData(),
  );

  getIt.registerFactory<ComponentContentAdapterBuilder>(
    () => ComponentContentAdapterBuilderImpl(),
  );

  getIt.registerFactory<WidgetInsetsHelper>(
    () => WidgetInsetsHelperImpl(),
  );
}

// @module
// abstract class AppModule {
//   @Named('SomaThemeData')
//   SomaThemeData provideSomaThemeData() => CoreSomaThemeData();
// }
