import 'package:flutter/material.dart' hide PageRoute;
import 'package:flutter_svg/svg.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/gen/assets.gen.dart';
import 'package:tcc_mobile/soma/soma.dart';

List<PageRoute> exampleWidgetRoutes = [
  PageRoute(
    route: Routes.exampleWidget,
    builder: (context, state) {
      final tokens = SomaTheme.getDesignTokensOf(context);

      return Scaffold(
        backgroundColor: SomaContext.primaryBackgroundColorOf(context),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1.0,
                    color: tokens.colors.brand.brand,
                  ),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: tokens.colors.brand.brand.withOpacity(0.5),
                      blurRadius: 50,
                      spreadRadius: 10,
                    ),
                    BoxShadow(
                      color: tokens.colors.brand.brand.withOpacity(0.5),
                      blurRadius: 15,
                      spreadRadius: -10,
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                Assets.images.logo,
              ),
              // const SomaIcon(
              //   iconName: 'message',
              // ),
              CardWidget(
                icon: 'message',
                title: 'Chat AI',
                subtitle: 'Start New Conversation',
                onTap: (deeplink) => {},
              ),
            ],
          ),
        ),
      );
    },
  ),
];

// return Scaffold(
//         backgroundColor: SomaContext.primaryBackgroundColorOf(context),
//         body: Center(
//           child: Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.transparent,
//               boxShadow: [
//                 BoxShadow(
//                   color: tokens.colors.brand.brand.withOpacity(0.5),
//                   blurRadius: 50,
//                   spreadRadius: 10,
//                 ),
//                 BoxShadow(
//                   color: tokens.colors.brand.brand.withOpacity(0.5),
//                   blurRadius: 15,
//                   spreadRadius: -10,
//                 ),
//               ],
//             ),
//             child: SvgPicture.asset(
//               Assets.images.logo,
//             ),
//           ),
//         ),
//       );