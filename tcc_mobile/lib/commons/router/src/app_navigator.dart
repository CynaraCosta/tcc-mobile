import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/commons/router/router.dart';


abstract class AppNavigator {
  void push(
    Routes route, {
    Map<String, String>? queryParams,
    Object? params,
  });
  void pop<T extends Object?>([T? value]);
  void pushToUrl(Uri url);
  void popUntilRoute(Routes route);
  bool canPop();
}

@LazySingleton(as: AppNavigator)
class AppNavigatorImpl extends AppNavigator {
  AppNavigatorImpl(
    this._router,
  );

  final AppRouterConfig _router;

  @override
  bool canPop() => _router.canPop();

  @override
  void pop<T extends Object?>([T? value]) {
    canPop()
        ? _router.pop(value)
        : SystemNavigator.pop(animated: true);
  }

  @override
  void popUntilRoute(Routes route) {
    final location =
        _router.routerDelegate.currentConfiguration.uri.toString();

    while (Uri.parse(location).path != route.path) {
      if (!canPop() || location == Routes.home.path) {
        return;
      }
      pop();
    }
  }

  @override
  void push(Routes route, {Map<String, String>? queryParams, Object? params}) {
    _router.pushNamed(route.name,
        queryParameters: queryParams ?? {}, extra: params ?? {});
  }

  @override
  void pushToUrl(Uri url) {
    _router.push('${url.path}?${url.query}');
  }
}
