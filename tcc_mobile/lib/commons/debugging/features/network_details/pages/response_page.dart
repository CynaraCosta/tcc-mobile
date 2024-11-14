import 'package:flutter/material.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/models/api_response_model.dart';
import 'package:tcc_mobile/commons/debugging/features/network/presentation/widgets/network_request_feedback_widget.dart';

class ResponsePage extends StatelessWidget {
  const ResponsePage({
    required this.model,
    super.key,
  });

  final ApiResponseModel model;

  @override
  Widget build(BuildContext context) {
    final responseJson = model.prettyJson;

    if (responseJson.isEmpty || responseJson == '{}') {
      return const NetworkRequestFeedbackWidget(
        message: 'No response data',
        iconData: Icon(Icons.warning),
      );
    } else {
      return CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: 1,
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.all(16),
              child: Text(responseJson),
            ),
          ),
        ],
      );
    }
  }
}
