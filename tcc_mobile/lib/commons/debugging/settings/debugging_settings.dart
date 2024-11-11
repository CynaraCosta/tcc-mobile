import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tcc_mobile/commons/debugging/features/menu/presentation/menu_page.dart';

class DebuggingSettings {
  DebuggingSettings._();

  static final DebuggingSettings _instance = DebuggingSettings._();

  static DebuggingSettings get instance => _instance;

  static const bool enabled = kDebugMode;

  Widget get debuggingPage => const MenuPage();
}
