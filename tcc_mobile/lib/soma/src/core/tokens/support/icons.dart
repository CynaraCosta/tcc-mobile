import 'package:tcc_mobile/soma/soma.dart';

abstract class SomaIcons {
  SomaIcons({
    required this.message,
    required this.gallery,
  });

  final String message;
  final String gallery;
  String getIconPath({SomaIconType? icon, String? iconName});
}
