import 'package:flutter/material.dart';
import '../domain/entity/explorer_carousel_entity.dart';

class ExplorerCarouselSuccessWidget extends StatelessWidget {
  const ExplorerCarouselSuccessWidget({
    required this.entity,
    super.key,
  });

  final ExplorerCarouselEntity entity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: 100,
      height: 100,
    );
  }
}