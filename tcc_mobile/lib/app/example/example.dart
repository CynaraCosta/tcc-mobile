import 'package:flutter/material.dart' hide PageRoute;
import 'package:flutter_svg/svg.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/gen/assets.gen.dart';
import 'package:tcc_mobile/soma/soma.dart';

List<PageRoute> exampleWidgetRoutes = [
  PageRoute(
    route: Routes.exampleWidget,
    builder: (context, state) {
      return Scaffold(
        backgroundColor: SomaContext.primaryBackgroundColorOf(context),
        body: Center(
          child: SvgPicture.asset(
            Assets.images.logo,
          ),
        ),
      );
    },
  ),
];
