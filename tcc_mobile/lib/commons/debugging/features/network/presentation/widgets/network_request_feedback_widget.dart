import 'package:flutter/material.dart';

class NetworkRequestFeedbackWidget extends StatelessWidget {
  const NetworkRequestFeedbackWidget({
    this.iconData,
    this.message,
    super.key,
  });

  final String? message;
  final Widget? iconData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconData != null) ... {
            iconData ?? const SizedBox.shrink(),
          },
          if (message != null) ... {
            Text(
              message ?? '',
            ),
          },
        ],
      ),
    );
  }
}
