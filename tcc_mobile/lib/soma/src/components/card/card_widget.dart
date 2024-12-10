import 'package:flutter/material.dart';

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
  final Function(String deeplink) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: const Column(
        children: [

        ],
      ),
    );
  }
}
