import 'package:flutter/material.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/models/api_response_model.dart';
import 'package:tcc_mobile/commons/debugging/utils/status_code_extensions.dart';

class NetworkRequestTile extends StatelessWidget {
  const NetworkRequestTile({
    required this.model,
    this.onTap,
    super.key,
  });

  final ApiResponseModel model;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      onTap: onTap,
      leading: Text(
        model.statusCode.toString(),
        style: textTheme.bodyLarge?.copyWith(
          color: model.statusCode.statusColor(),
          fontWeight: FontWeight.w900,
        ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.method,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(model.path)),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.baseUrl),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.requestTime.toString()),
              Text(
                model.responseTime
                    .difference(model.requestTime)
                    .inMilliseconds
                    .msFormat
                    .toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
