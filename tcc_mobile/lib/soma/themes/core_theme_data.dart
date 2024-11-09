import 'package:tcc_mobile/soma/soma.dart';

class CoreSomaThemeData implements SomaThemeData {
  @override
  SomaComponentTokens get componentsTokens => 
    BaseSomaComponentTokens(designTokens: designTokens);

  @override
  SomaDesignTokens get designTokens => 
    BaseSomaDesignTokens();

  @override
  String get name => 'core';

  @override
  SomaSupportTokens? get supportTokens => throw UnimplementedError();
}