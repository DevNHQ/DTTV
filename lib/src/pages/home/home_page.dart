import 'package:dttv/src/commons/styles.dart';
import 'package:dttv/src/components/custom_appbar.dart';
import 'package:dttv/src/pages/home/component/cursor_painter.dart';
import 'package:dttv/src/pages/home/home_controller.dart';
import 'package:dttv/src/pages/test/test_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ClipPath(
      clipper: CursorPainter(points: 8),
      child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Center(
            child: Text('1'),
          )),
    )));
  }
//     Expanded(
//               child: ListWheelScrollView(
//                 diameterRatio: 1.1,
//                 offAxisFraction: 0,
//                 itemExtent: 75,
//                 children: List.generate(
//                   1000,
//                   (index) => InkWell(
//                     onTap: () => Get.to(() => const TestPage()),
//                     child: Container(
//                       width: Get.width - 32,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(40.0),
//                         ),
//                         gradient: LinearGradient(
//                           colors: [
//                             Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
//                                 .withOpacity(1.0),
//                             Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
//                                 .withOpacity(1.0)
//                           ],
//                           begin: const FractionalOffset(0.0, 0.0),
//                           end: const FractionalOffset(0.5, 0.0),
//                           stops: const [0.0, 1.0],
//                           tileMode: TileMode.clamp,
//                         ),
//                       ),
//                       child: Text(index.toString()),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
}
