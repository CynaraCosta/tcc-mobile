import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:tcc_mobile/commons/debugging/debugging.dart';
import 'package:tcc_mobile/commons/notifier/brightness_notifier.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/di/injection.dart';
import 'package:tcc_mobile/soma/soma.dart';

void main() {
  configureDependencies();
  runApp(
    TccMobile(
      router: GetIt.I.get<AppRouterConfig>(),
      somaThemeData: GetIt.I.get<SomaThemeData>(),
    ),
  );
}

class TccMobile extends StatefulWidget {
  const TccMobile({
    required this.router,
    required this.somaThemeData,
    super.key,
  });

  final SomaThemeData somaThemeData;
  final AppRouterConfig router;

  @override
  State<TccMobile> createState() => _TccMobileState();
}

class _TccMobileState extends State<TccMobile> with WidgetsBindingObserver {
  late SomaThemeModeNotifier _themeModeNotifier;
  late final WidgetsBinding _widgetsBinding;

  @override
  void initState() {
    super.initState();
    _widgetsBinding = WidgetsBinding.instance;
    _widgetsBinding.addObserver(this);

    final brightness = PlatformDispatcher.instance.platformBrightness;

    _themeModeNotifier = SomaThemeModeNotifier(
      ValueNotifier<Brightness>(
        brightness,
      ),
    );
  }

  @override
  void didChangePlatformBrightness() {
    final brightness = PlatformDispatcher.instance.platformBrightness;

    _themeModeNotifier.changeBrightness(
      brightness: brightness,
    );
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ValueListenableBuilder(
      valueListenable: _themeModeNotifier.appBrightness,
      builder: (context, value, child) {
        final debuggingFloating = DebuggingFactory.buildDebugging(
          () {
            // ignore: avoid_print
            print('clicou $value');
          },
        );
        bool isInverse = (value == Brightness.dark) ? true : false;
        return SomaTheme(
          data: widget.somaThemeData,
          child: SomaContext(
            isInverse: isInverse,
            child: MaterialApp.router(
              builder: debuggingFloating.createBuilderFloating,
              routerConfig: widget.router,
            ),
          ),
        );
      },
    );
  }
}
