import 'package:flutter/material.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/models/api_response_model.dart';

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
    return ListTile(
      onTap: onTap,
      leading: Text(
        model.statusCode.toString(),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.method,
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
            children: [
              Text(model.requestTime.toString()),
              Text(
                model.responseTime
                    .difference(model.requestTime)
                    .inMilliseconds
                    .toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
