import 'package:flutter/foundation.dart';

class DebuggingSettings {
  DebuggingSettings._();

  static final DebuggingSettings _instance = DebuggingSettings._();

  static DebuggingSettings get instance => _instance;

  static const bool enabled = kDebugMode;
}
