import 'package:flutter/material.dart' hide PageRoute;
import 'package:get_it/get_it.dart';
import 'package:tcc_mobile/app/example/example.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/pages/home_page.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/explorer_carousel/domain/entity/explorer_carousel_entity.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/history_cards/domain/entity/history_cards_entity.dart';
import 'package:tcc_mobile/commons/debugging/routes/debugging_routes.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/soma/soma.dart';

final AppNavigator appNavigator = GetIt.I.get<AppNavigator>();

final homeRoute = PageRoute(
  route: Routes.home,
  builder: (context, __) {
    return Scaffold(
      backgroundColor: SomaContext.primaryBackgroundColorOf(context),
      body: HomePage(
        carouselProvider:
            GetIt.I.get<WidgetContentCommand<ExplorerCarouselEntity>>(),
        historyProvider:
            GetIt.I.get<WidgetContentCommand<HistoryCardsEntity>>(),
        navigator: GetIt.I.get<AppNavigator>(),
      ),
    );
  },
);

final routes = <PageRoute>[
  homeRoute,
  ...exampleWidgetRoutes,
  ...xdebuggingRoutes,
];
