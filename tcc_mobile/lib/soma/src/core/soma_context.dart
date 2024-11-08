import 'package:flutter/material.dart';

class SomaContext extends InheritedWidget {
  const SomaContext({
    required super.child,
    super.key,
    this.isInverse = false,
  });
  final bool isInverse;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (oldWidget is SomaContext) {
      return oldWidget.isInverse != isInverse;
    }
    return false;
  }

  static bool of(BuildContext context) {
    final SomaContext? result =
        context.dependOnInheritedWidgetOfExactType<SomaContext>();
    return result?.isInverse ?? false;
  }
}
