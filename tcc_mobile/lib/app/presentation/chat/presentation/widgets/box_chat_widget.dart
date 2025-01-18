import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

class BoxChatWidget extends StatelessWidget {
  const BoxChatWidget({
    required this.text,
    required this.isUser,
    super.key,
  });

  final String text;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);
    const minWidth = 50.0;
    const maxWidthDouble = 0.70;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * maxWidthDouble,
          minWidth: minWidth,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: tokens.spacings.inline.xs,
            vertical: tokens.spacings.inline.xxs,
          ),
          decoration: BoxDecoration(
            color: isUser
                ? tokens.colors.brand.brand
                : tokens.colors.brand.brandSecondary,
            borderRadius: BorderRadius.circular(tokens.spacings.inline.xxs),
          ),
          child: SomaText(
            text: text,
            type: SomaTypographyType.description,
            align: TextAlign.start,
            customTextStyle: TextStyle(
              color: isUser
                  ? tokens.colors.fontColor.dark.primary
                  : tokens.colors.fontColor.light.primary,
            ),
          ),
        ),
      ),
    );
  }
}
