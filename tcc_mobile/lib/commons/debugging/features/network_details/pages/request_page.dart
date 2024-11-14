import 'package:flutter/material.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/models/api_response_model.dart';
import 'package:tcc_mobile/commons/debugging/features/network_details/widgets/details_tile.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({
    required this.model,
    super.key,
  });

  final ApiResponseModel model;

  @override
  Widget build(BuildContext context) {
    final items = model.headers;
    
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList.separated(
            itemBuilder: (_, index) => DetailsTile(
              title: items.keys.elementAtOrNull(index) ?? '',
              subtitle: items.values.elementAtOrNull(index)[0] ?? '',
              // subtitle: '',
            ),
            separatorBuilder: (_, __) => const SizedBox(
              height: 16,
            ),
            itemCount: items.length,
          ),
        ),
        if (model.prettyJsonRequest.isNotEmpty) ...{
          SliverList.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.all(16),
              child: Text(model.prettyJsonRequest),
            ),
          ),
        },
      ],
    );
  }
}
