import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

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

  static Color? primaryBackgroundColorOf(BuildContext context) {
    var tokens = SomaTheme.getDesignTokensOf(context);
    final SomaContext? result =
        context.dependOnInheritedWidgetOfExactType<SomaContext>();

    return result?.isInverse == true
        ? tokens.colors.background.dark.primary
        : tokens.colors.background.light.primary;
  }

  static Color? secondaryBackgroundColorOf(BuildContext context) {
    var tokens = SomaTheme.getDesignTokensOf(context);
    final SomaContext? result =
        context.dependOnInheritedWidgetOfExactType<SomaContext>();

    return result?.isInverse == true
        ? tokens.colors.background.dark.secondary
        : tokens.colors.background.light.secondary;
  }

  static Color? primaryFontColorOf(BuildContext context) {
    var tokens = SomaTheme.getDesignTokensOf(context);
    final SomaContext? result =
        context.dependOnInheritedWidgetOfExactType<SomaContext>();

    return result?.isInverse == true
        ? tokens.colors.fontColor.light.primary
        : tokens.colors.fontColor.dark.primary;
  }
}
