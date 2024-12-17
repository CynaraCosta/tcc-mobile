import 'package:flutter/material.dart' hide PageRoute, WidgetState;
import 'package:tcc_mobile/commons/router/router.dart';
import 'package:tcc_mobile/soma/soma.dart';

List<PageRoute> exampleWidgetRoutes = [
  PageRoute(
    route: Routes.exampleWidget,
    builder: (context, state) {
      return Scaffold(
        backgroundColor: SomaContext.primaryBackgroundColorOf(context),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   width: 150,
            //   height: 150,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     border: Border.all(
            //       width: 1.0,
            //       color: tokens.colors.brand.brand,
            //     ),
            //     color: Colors.transparent,
            //     boxShadow: [
            //       BoxShadow(
            //         color: tokens.colors.brand.brand.withOpacity(0.5),
            //         blurRadius: 50,
            //         spreadRadius: 10,
            //       ),
            //       BoxShadow(
            //         color: tokens.colors.brand.brand.withOpacity(0.5),
            //         blurRadius: 15,
            //         spreadRadius: -10,
            //       ),
            //     ],
            //   ),
            // ),
          ],
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