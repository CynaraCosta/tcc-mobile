import 'package:flutter/material.dart' hide PageRoute;
import 'package:get_it/get_it.dart';
import 'package:tcc_mobile/app/example/example.dart';
import 'package:tcc_mobile/commons/debugging/routes/debugging_routes.dart';
import 'package:tcc_mobile/commons/network/api_data_source_delegate.dart';
import 'package:tcc_mobile/commons/network/data/request_params.dart';
import 'package:tcc_mobile/commons/network/data/request_type.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/gen/colors.gen.dart';
import 'package:tcc_mobile/soma/soma.dart';

final AppNavigator appNavigator = GetIt.I.get<AppNavigator>();

final homeRoute = PageRoute(
  route: Routes.home,
  builder: (_, __) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 100,
        child: ElevatedButton(
          onPressed: () async {
            final delegate = GetIt.I.get<ApiDataSourceDelegate>();
            delegate.fetchAsFuture(
              params: const RequestParams(
                endpoint: '/v1/conversations',
                requestType: RequestType.get,
              ),
              mapper: (mapper) {},
            );
            appNavigator.pushToUrl(Uri.parse('/example/example_widget'));
          },
          child: const SomaText(
            text: 'Testeee cynarinha',
            type: SomaTypographyType.title1,
            customTextStyle: TextStyle(
              color: ColorName.brand,
            ),
          ),
        ),
      ),
    );
  },
);

final routes = <PageRoute>[
  homeRoute,
  ...exampleWidgetRoutes,
  ...xdebuggingRoutes,
];
