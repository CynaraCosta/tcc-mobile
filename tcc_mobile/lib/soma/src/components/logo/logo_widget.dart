import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcc_mobile/gen/assets.gen.dart';
import 'package:tcc_mobile/soma/soma.dart';

class LogoImageWidget extends StatelessWidget {
  const LogoImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);
    final style = SomaTheme.getComponentTokensOf(context).logo;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Glow effect
          Container(
            width: MediaQuery.sizeOf(context).width * style.glowWidthDouble,
            height: MediaQuery.sizeOf(context).height * style.glowHeightDouble,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  tokens.colors.brand.brand.withOpacity(
                    style.glowHigherOpacity,
                  ),
                  tokens.colors.brand.brand.withOpacity(
                    style.glowLowerOpacity,
                  ),
                ],
                stops: style.glowStops,
              ),
            ),
          ),
          // Inner circle
          Container(
            width: MediaQuery.sizeOf(context).width * style.imageWidthDouble,
            height: MediaQuery.sizeOf(context).height * style.imageHeightDouble,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: style.bgColor,
            ),
          ),
          // Central element (image)
          SvgPicture.asset(
            Assets.images.logo, // Caminho da imagem (coloque sua imagem aqui)
            width: MediaQuery.sizeOf(context).width * style.imageWidthDouble,
            height: MediaQuery.sizeOf(context).height * style.imageHeightDouble,
          ),
        ],
      ),
    );
  }
}
