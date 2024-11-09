import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/di/injection.dart';
import 'package:tcc_mobile/root.dart';
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
