import 'package:flutter/material.dart' hide PageRoute;
import 'package:get_it/get_it.dart';
import 'package:tcc_mobile/app/example/example.dart';
import 'package:tcc_mobile/commons/router/router.dart';

final AppNavigator appNavigator = GetIt.I.get<AppNavigator>();

final homeRoute = PageRoute(
  route: Routes.home,
  builder: (_, __) {
    return Container(
      color: Colors.purple,
      child: Center(
        child: SizedBox(
          width: 200,
          height: 100,
          child: ElevatedButton(
            onPressed: () {
              appNavigator.pushToUrl(Uri.parse('/example/example_widget'));
            },
            child: const Text('Ir pra example'),
          ),
        ),
      ),
    );
  },
);

final routes = <PageRoute>[
  homeRoute,
  ...exampleWidgetRoutes,
];
