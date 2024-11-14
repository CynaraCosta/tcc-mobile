import 'package:flutter/material.dart';
import 'package:tcc_mobile/commons/debugging/utils/context_extensions.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 5,
          child: Text(
            subtitle,
            style: context.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
