import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

abstract class SomaThemeData {
  SomaThemeData({
    required this.designTokens,
    required this.name,
    required this.componentsTokens,
    required this.supportTokens,
  });

  final SomaDesignTokens designTokens;
  final SomaComponentTokens componentsTokens;
  final SomaSupportTokens? supportTokens;

  final String name;
}

class SomaTheme extends InheritedWidget {
  const SomaTheme({
    required super.child,
    required this.data,
    super.key,
  });
  final SomaThemeData data;
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (oldWidget is SomaTheme) {
      return oldWidget.data != data;
    }
    return false;
  }

  static SomaComponents getComponentTokensOf(
    BuildContext context, {
    bool? isInverse,
  }) {
    final isInverseTheme = isInverse ?? SomaContext.of(context);
    final SomaTheme? result =
        context.dependOnInheritedWidgetOfExactType<SomaTheme>();
    assert(result != null, 'no SomaTheme found in context');
    return isInverseTheme
        ? result!.data.componentsTokens.inverse
        : result!.data.componentsTokens.defaultTokens;
  }

  static SomaDesignTokens getDesignTokensOf(BuildContext context) {
    final SomaTheme? result =
        context.dependOnInheritedWidgetOfExactType<SomaTheme>();
    assert(result != null, 'no SomaTheme found in context');
    return result!.data.designTokens;
  }
}
