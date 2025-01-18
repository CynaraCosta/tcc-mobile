import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

class LoadingDotsWidget extends StatefulWidget {
  const LoadingDotsWidget({
    required this.isUser,
    super.key,
  });

  final bool isUser;

  @override
  State<LoadingDotsWidget> createState() => _LoadingDotsWidgetState();
}

class _LoadingDotsWidgetState extends State<LoadingDotsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        int dotCount = (_controller.value * 3).ceil();
        String dots = '.' * dotCount + ' ' * (3 - dotCount);
        return Text(
          dots,
          style: TextStyle(
            color: widget.isUser
                ? tokens.colors.fontColor.dark.primary
                : tokens.colors.fontColor.light.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
