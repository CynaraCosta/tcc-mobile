import 'package:flutter/material.dart' hide PageRoute;
import 'package:tcc_mobile/commons/router/router.dart';

List<PageRoute> exampleWidgetRoutes = [
  PageRoute(
    route: Routes.exampleWidget,
    builder: (context, state) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.green,
        ),
      );
    },
  ),
];