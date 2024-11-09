import 'package:flutter/material.dart';

class SomaThemeModeNotifier {
  SomaThemeModeNotifier(this.appBrightness);

  final dynamic appBrightness;

  void changeBrightness({required Brightness brightness}) {
    appBrightness.value = brightness;
  }
}