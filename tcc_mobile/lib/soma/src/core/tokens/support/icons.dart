import 'package:tcc_mobile/soma/soma.dart';

abstract class SomaIcons {
  SomaIcons({
    required this.message,
    required this.gallery,
    required this.rotateRight,
  });

  final String message;
  final String gallery;
  final String rotateRight;
  String getIconPath({SomaIconType? icon, String? iconName});
}
