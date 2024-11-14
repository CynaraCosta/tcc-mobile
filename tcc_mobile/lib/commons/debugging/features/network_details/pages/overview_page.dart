import 'package:flutter/material.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/models/api_response_model.dart';
import 'package:tcc_mobile/commons/debugging/features/network_details/widgets/details_tile.dart';
import 'package:tcc_mobile/commons/debugging/utils/status_code_extensions.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({
    required this.model,
    super.key,
  });

  final ApiResponseModel model;

  @override
  Widget build(BuildContext context) {
    final items = {
      'URL': '${model.baseUrl}${model.path}',
      'Method': model.method,
      'Response':
          '${model.statusCode.toString()} ${model.statusCode.statusCode()}',
      'Request time': model.requestTime.toIso8601String(),
      'Response time': model.responseTime.toIso8601String(),
      'Query Parameters': model.queryParameters,
      'Body': model.request.toString(),
      'CURL': model.curl,
    };

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (_, index) => DetailsTile(
        title: items.keys.elementAtOrNull(index) ?? '',
        subtitle: items.values.elementAtOrNull(index) ?? '',
      ),
      separatorBuilder: (_, __) => const SizedBox(
        height: 16,
      ),
      itemCount: items.length,
    );
  }
}
