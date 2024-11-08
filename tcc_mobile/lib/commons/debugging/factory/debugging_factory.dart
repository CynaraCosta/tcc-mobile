import 'package:flutter/foundation.dart';
import 'package:tcc_mobile/commons/debugging/debugging.dart';

class DebuggingFactory {
  DebuggingFactory._();

  static DebugFloating buildDebugging(
    VoidCallback? onTap,
  ) {
    return DebugFloatingCaller(onTap);
  }
}
