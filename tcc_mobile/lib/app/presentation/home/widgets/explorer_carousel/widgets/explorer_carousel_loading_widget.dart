import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

class ExplorerCarouselLoadingWidget extends StatelessWidget {
  const ExplorerCarouselLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);
    final cardHeight = MediaQuery.sizeOf(context).height * 0.189;
    final cardWidth = MediaQuery.sizeOf(context).width * 0.4;
    return SkeletonScope(
      runAnimation: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxSkeleton(
            height: tokens.spacings.inline.sm,
            width: cardWidth,
            borderRadius: BorderRadius.circular(tokens.spacings.inline.xxs),
          ),
          SizedBox(
            height: tokens.spacings.inline.xs,
          ),
          Row(
            children: [
              BoxSkeleton(
                height: cardHeight,
                width: cardWidth,
                borderRadius: BorderRadius.circular(tokens.spacings.inline.xxs),
              ),
              SizedBox(
                width: tokens.spacings.inline.xxs,
              ),
              BoxSkeleton(
                height: cardHeight,
                width: cardWidth,
                borderRadius: BorderRadius.circular(tokens.spacings.inline.xxs),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
