import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_mobile/commons/router/router.dart';


class PageRoute {
  PageRoute({
    required this.route,
    required this.builder,
    this.routes,
  });

  final Routes route;
  final Widget Function(BuildContext, GoRouterState) builder;
  final List<PageRoute>? routes;

  GoRoute toGoRoute({bool isSubRoute = false}) => GoRoute(
        name: route.name,
        path: (isSubRoute && route.path.startsWith('/'))
            ? route.path.substring(1)
            : route.path,
        routes: routes
                ?.map<GoRoute>((route) => route.toGoRoute(isSubRoute: true))
                .toList() ??
            [],
        builder: builder,
      );
}
