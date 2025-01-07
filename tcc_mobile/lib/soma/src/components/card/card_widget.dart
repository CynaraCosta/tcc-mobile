import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    required this.icon,
    required this.title,
    required this.onTap,
    this.subtitle,
    super.key,
  });

  final String icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);
    final style = SomaTheme.getComponentTokensOf(context).card;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: style.shadowColor.withOpacity(
                        style.doubleOpacity,
                      ),
                      offset: style.offset,
                      blurRadius: style.blurRadius,
                      spreadRadius: style.spreadRadius,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: style.bgColor,
                  child: SomaIcon(
                    iconName: icon,
                    color: style.iconColor,
                    size: SomaIconSize.md,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SomaText(
                    text: title,
                    type: SomaTypographyType.title1,
                    customTextStyle: TextStyle(
                      color: tokens.colors.brand.brand,
                    ),
                  ),
                  if (subtitle != null) ...{
                    SomaText(
                      text: subtitle!,
                      type: SomaTypographyType.description,
                      align: TextAlign.start,
                    ),
                  },
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
