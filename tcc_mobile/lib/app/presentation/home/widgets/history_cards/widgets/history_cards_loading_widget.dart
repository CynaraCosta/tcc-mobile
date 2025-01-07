import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/soma/soma.dart';

class HistoryCardsLoadingWidget extends StatelessWidget {
  const HistoryCardsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);
    final titleWidth = MediaQuery.sizeOf(context).height * 0.189;
    final subtitleWidth = MediaQuery.sizeOf(context).height * 0.1;
    return SkeletonScope(
      runAnimation: true,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BoxSkeleton(
                height: tokens.spacings.inline.sm,
                width: titleWidth,
                borderRadius: BorderRadius.circular(tokens.spacings.inline.xxs),
              ),
              BoxSkeleton(
                height: tokens.spacings.inline.sm,
                width: subtitleWidth,
                borderRadius: BorderRadius.circular(tokens.spacings.inline.xxs),
              ),
            ],
          ),
          SizedBox(
            height: tokens.spacings.inline.xs,
          ),
          Column(
            children: [
              BoxSkeleton(
                height: tokens.spacings.inline.xl,
                borderRadius: BorderRadius.circular(tokens.spacings.inline.xxs),
              ),
              SizedBox(
                height: tokens.spacings.inline.xs,
              ),
              BoxSkeleton(
                height: tokens.spacings.inline.xl,
                borderRadius: BorderRadius.circular(tokens.spacings.inline.xxs),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
