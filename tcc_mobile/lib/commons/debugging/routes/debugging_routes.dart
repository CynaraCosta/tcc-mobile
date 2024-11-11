import 'package:tcc_mobile/commons/debugging/debugging.dart';
import 'package:tcc_mobile/commons/router/router.dart';

final List<PageRoute> xdebuggingRoutes = [
  PageRoute(
    route: Routes.xdebuggingPage,
    builder: (_, __) => DebuggingSettings.instance.debuggingPage,
  ),
];
