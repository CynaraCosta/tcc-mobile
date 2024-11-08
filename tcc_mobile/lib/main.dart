import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tcc_mobile/commons/debugging/debugging.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/injection.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AppRouterConfig router = GetIt.I();

  @override
  Widget build(BuildContext context) {
    final debuggingFloating = DebuggingFactory.buildDebugging(
      () {
        // ignore: avoid_print
        print('clicou');
      },
    );
    return MaterialApp.router(
      builder: debuggingFloating.createBuilderFloating,
      routerConfig: router,
    );
  }
}
