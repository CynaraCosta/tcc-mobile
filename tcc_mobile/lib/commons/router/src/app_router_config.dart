import 'package:go_router/go_router.dart';
import 'package:tcc_mobile/commons/router/router.dart';


class AppRouterConfig extends GoRouter {
  AppRouterConfig({
    required this.routes,
  }) : super(
          routes: routes
              .map<GoRoute>((PageRoute route) => route.toGoRoute())
              .toList(),
              errorBuilder: (context, state) => const NotFoundPage(),
        );

  final List<PageRoute> routes;
}
