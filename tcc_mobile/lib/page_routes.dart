import 'package:flutter/material.dart' hide PageRoute;
import 'package:get_it/get_it.dart';
import 'package:tcc_mobile/app/example/example.dart';
import 'package:tcc_mobile/commons/debugging/routes/debugging_routes.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/components_page_factory.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/soma/soma.dart';

final AppNavigator appNavigator = GetIt.I.get<AppNavigator>();

final homeRoute = PageRoute(
  route: Routes.home,
  builder: (context, __) {
    final homeFactory = GetIt.I.get<ComponentsPageFactory>(
      instanceName: 'HomePageFactory',
    );
    final Widget home = homeFactory.create();
    return Scaffold(
      backgroundColor: SomaContext.primaryBackgroundColorOf(context),
      body: home,
    );
  },
);

final routes = <PageRoute>[
  homeRoute,
  ...exampleWidgetRoutes,
  ...xdebuggingRoutes,
];
