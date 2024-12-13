import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

class SomaText extends StatelessWidget {
  const SomaText({
    required this.text,
    this.type,
    this.customTextStyle,
    super.key,
  });

  final String text;
  final SomaTypographyType? type;
  final TextStyle? customTextStyle;

  TextStyle getStyle(
    BuildContext context,
    SomaTextTokens? tokens,
    TextStyle? customTextStyle,
  ) {
    final designTokens = SomaTheme.getDesignTokensOf(context);
    final isInverse = SomaContext.of(context);
    final textColor = isInverse
        ? designTokens.colors.fontColor.light.primary
        : designTokens.colors.fontColor.dark.primary;
    return TextStyle(
      fontFamily: tokens?.fontFamily ?? designTokens.fonts.family.base,
      fontSize: tokens?.fontSize ?? designTokens.fonts.size.sm,
      fontWeight: tokens?.fontWeight ?? designTokens.fonts.weight.regular,
      color: tokens?.textColor ?? textColor,
    ).merge(
      customTextStyle?.copyWith(
        color: customTextStyle.color,
        fontFamily: customTextStyle.fontFamily,
        fontSize: customTextStyle.fontSize,
        fontWeight: customTextStyle.fontWeight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectieStyle = getStyle(
      context,
      type?.getTokens(context),
      customTextStyle,
    );

    return Text(
      text,
      style: effectieStyle,
    );
  }
}
