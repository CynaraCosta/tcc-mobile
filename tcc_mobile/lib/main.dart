import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tcc_mobile/commons/debugging/debugging.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/injection.dart';
import 'package:tcc_mobile/soma/soma.dart';

void main() {
  configureDependencies();
  runApp(TccMobile(
    somaThemeData: GetIt.I.get<SomaThemeData>(),
  ));
}

class TccMobile extends StatefulWidget {
  const TccMobile({
    required this.somaThemeData,
    super.key,
  });

  final SomaThemeData somaThemeData;

  @override
  State<TccMobile> createState() => _TccMobileState();
}

class _TccMobileState extends State<TccMobile> with WidgetsBindingObserver {
  final AppRouterConfig router = GetIt.I();

  @override
  Widget build(BuildContext context) {
    final debuggingFloating = DebuggingFactory.buildDebugging(
      () {
        // ignore: avoid_print
        print('clicou');
      },
    );
    return SomaTheme(
      data: widget.somaThemeData,
      child: MaterialApp.router(
        builder: debuggingFloating.createBuilderFloating,
        routerConfig: router,
      ),
    );
  }
}
