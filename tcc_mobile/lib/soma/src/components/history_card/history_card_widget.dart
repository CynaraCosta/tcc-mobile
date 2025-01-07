import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);
    final style = SomaTheme.getComponentTokensOf(context).historyCard;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          tokens.spacings.inline.xxs,
        ),
        color: style.bgColor,
      ),
      child: InkWell(
        onTap: onTap,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: tokens.spacings.inline.xs,
            vertical: tokens.spacings.inline.xs,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SomaIcon(
                    iconName: icon,
                    color: style.iconColor,
                    size: SomaIconSize.md,
                  ),
                  SizedBox(
                    width: tokens.spacings.inline.xs,
                  ),
                  SomaText(
                    text: title,
                    type: SomaTypographyType.description,
                  ),
                ],
              ),
              SomaIcon(
                type: SomaIconType.arrowRight,
                color: style.iconColor,
                size: SomaIconSize.md,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
