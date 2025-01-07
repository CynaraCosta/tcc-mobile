import 'package:flutter/material.dart';
import 'package:tcc_mobile/app/presentation/home/widgets/explorer_carousel/resources/explorer_carousel_strings.dart';
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

    return GestureDetector(
      onTap: onTapError,
      child: Column(
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
            text: ExplorerCarouselStrings.errorTitle,
            type: SomaTypographyType.title3,
          ),
          SizedBox(
            height: tokens.spacings.inline.xxxs,
          ),
          const SomaText(
            text: ExplorerCarouselStrings.errorDescription,
            type: SomaTypographyType.description,
          ),
        ],
      ),
    );
  }
}
