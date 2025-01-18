import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcc_mobile/soma/soma.dart';

class SomaIcon extends StatelessWidget {
  const SomaIcon({
    this.iconName,
    this.type,
    this.size,
    this.color,
    this.onTap,
    super.key,
  });

  final String? iconName;
  final SomaIconType? type;
  final SomaIconSize? size;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final designTokens = SomaTheme.getDesignTokensOf(context);
    final icon = designTokens.icons.getIconPath(icon: type, iconName: iconName);
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        icon,
        width: size?.size ?? designTokens.spacings.inline.xs,
        height: size?.size ?? designTokens.spacings.inline.xs,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
  }
}
