import 'package:tcc_mobile/gen/assets.gen.dart';
import 'package:tcc_mobile/soma/soma.dart';
import 'package:tcc_mobile/soma/src/core/base/support/icons_string.dart';

class BaseSomaIcons implements SomaIcons {
  @override
  String get message => Assets.icons.message;

  String getIconPath(SomaIcon? icon, String? iconName) {
    if (icon != null) {
      switch (icon.value) {
        case SomaIconsStrings.message:
          return message;
        default:
          throw Exception('Icon not found');
      }
    } else {
      switch (iconName) {
        case SomaIconsStrings.message:
          return message;
        default:
          throw Exception('Icon Name not found');
      }
    }
  }
}
