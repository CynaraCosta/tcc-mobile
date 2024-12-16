import 'package:flutter/material.dart';

class ExplorerCarouselErrorWidget extends StatelessWidget {
  const ExplorerCarouselErrorWidget({
    this.onTapError,
    super.key,
  });

  final void Function()? onTapError;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 100,
      height: 100,
    );
  }
}