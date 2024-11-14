import 'package:flutter/material.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/models/api_response_model.dart';
import 'package:tcc_mobile/commons/debugging/features/network_details/overview_page.dart';
import 'package:tcc_mobile/commons/debugging/features/network_details/request_page.dart';
import 'package:tcc_mobile/commons/debugging/features/network_details/response_page.dart';
import 'package:tcc_mobile/commons/debugging/utils/context_extensions.dart';

class NetworkRequestDetailsPage extends StatelessWidget {
  NetworkRequestDetailsPage({
    required this.model,
    super.key,
  });

  final ApiResponseModel model;
  final _titles = ['OVERVIEW', 'REQUEST', 'RESPONSE'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _titles.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${model.method} ${model.path}'),
          actions: [
            IconButton(
              tooltip: 'Copy Response to clipboard',
              onPressed: () async {
                await context.copyToClipboard(
                  model.prettyJson,
                  type: 'Response',
                );
              },
              icon: const Icon(Icons.copy),
            ),
            IconButton(
              tooltip: 'Copy CURL to clipboard',
              onPressed: () async {
                await context.copyToClipboard(
                  model.curl,
                  type: 'CURL',
                );
              },
              icon: const Icon(Icons.share),
            ),
          ],
          bottom: TabBar(
            tabs: _titles
                .map(
                  (e) => Tab(
                    text: e,
                  ),
                )
                .toList(),
          ),
        ),
        body: TabBarView(
          children: [
            OverviewPage(
              model: model,
            ),
            RequestPage(
              model: model,
            ),
            ResponsePage(
              model: model,
            ),
          ],
        ),
      ),
    );
  }
}
