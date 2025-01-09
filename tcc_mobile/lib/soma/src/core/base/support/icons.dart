import 'package:tcc_mobile/gen/assets.gen.dart';
import 'package:tcc_mobile/soma/soma.dart';

class BaseSomaIcons implements SomaIcons {
  @override
  String get message => Assets.icons.message;

  @override
  String get gallery => Assets.icons.gallery;

  @override
  String get rotateRight => Assets.icons.rotateRight;

  @override
  String get arrowRight => Assets.icons.arrowRight;

  @override
  String getIconPath({SomaIconType? icon, String? iconName}) {
    if (icon != null) {
      switch (icon.value) {
        case SomaIconsStrings.message:
          return message;
        case SomaIconsStrings.gallery:
          return gallery;
        case SomaIconsStrings.rotateRight:
          return rotateRight;
        case SomaIconsStrings.arrowRight:
          return arrowRight;
        default:
          return message;
      }
    } else {
      switch (iconName) {
        case SomaIconsStrings.message:
          return message;
        case SomaIconsStrings.gallery:
          return gallery;
        case SomaIconsStrings.rotateRight:
          return rotateRight;
        case SomaIconsStrings.arrowRight:
          return arrowRight;
        default:
          return message;
      }
    }
  }
}
