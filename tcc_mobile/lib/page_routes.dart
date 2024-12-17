import 'package:get_it/get_it.dart';
import 'package:tcc_mobile/app/example/example.dart';
import 'package:tcc_mobile/app/presentation/home/pages/home_page.dart';
import 'package:tcc_mobile/app/presentation/home/widgets/explorer_carousel/domain/entity/explorer_carousel_entity.dart';
import 'package:tcc_mobile/commons/debugging/routes/debugging_routes.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/router/router.dart';

final AppNavigator appNavigator = GetIt.I.get<AppNavigator>();

final homeRoute = PageRoute(
  route: Routes.home,
  builder: (_, __) {
    return HomePage(
        carouselProvider:
            GetIt.I.get<WidgetContentCommand<ExplorerCarouselEntity>>(),
      );
  },
);

final routes = <PageRoute>[
  homeRoute,
  ...exampleWidgetRoutes,
  ...xdebuggingRoutes,
];
