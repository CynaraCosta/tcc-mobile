import 'package:flutter/material.dart';
import 'package:tcc_mobile/app/presentation/chat/utils/chat_strings.dart';
import 'package:tcc_mobile/soma/soma.dart';

class BottomChatWidget extends StatelessWidget {
  BottomChatWidget({
    required this.onSubmitted,
    super.key,
  });

  final Function(String)? onSubmitted;
  final TextEditingController _controller = TextEditingController();

  void _handleSubmission(String text) {
    if (text.isNotEmpty) {
      onSubmitted?.call(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);
    final bgColor = SomaContext.secondaryBackgroundColorOf(context);
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(tokens.spacings.inline.xs),
            ),
            child: TextField(
              controller: _controller,
              onSubmitted: _handleSubmission,
              decoration: InputDecoration(
                fillColor: bgColor,
                hintText: ChatStrings.hintTextFieldChat,
                hintStyle: TextStyle(
                  fontFamily: tokens.fonts.family.base,
                  fontWeight: tokens.fonts.weight.regular,
                ),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    tokens.spacings.inline.xxxs,
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: tokens.spacings.inline.xxs,
        ),
        CircleAvatar(
          backgroundColor: bgColor,
          child: SomaIcon(
            type: SomaIconType.send,
            color: tokens.colors.brand.brand,
            size: SomaIconSize.md,
            onTap: () {
              final text = _controller.text;
              _handleSubmission(text);
            },
          ),
        ),
      ],
    );
  }
}
