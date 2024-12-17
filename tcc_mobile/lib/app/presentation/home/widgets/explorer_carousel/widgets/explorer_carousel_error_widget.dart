import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

class ExplorerCarouselErrorWidget extends StatelessWidget {
  const ExplorerCarouselErrorWidget({
    this.onTapError,
    super.key,
  });

  final void Function()? onTapError;

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SomaIcon(
          type: SomaIconType.rotateRight,
          color: tokens.colors.brand.brand,
          size: SomaIconSize.md,
        ),
        SizedBox(
          height: tokens.spacings.inline.xxs,
        ),
        const SomaText(
          text: 'Tente novamente depois',
          type: SomaTypographyType.title3,
        ),
      ],
    );
  }
}
