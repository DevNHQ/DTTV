import 'dart:math';
import 'dart:math' as math;
import 'package:dttv/src/commons/styles.dart';
import 'package:dttv/src/components/custom_appbar.dart';
import 'package:dttv/src/pages/home/component/cursor_painter.dart';
import 'package:dttv/src/pages/home/component/demo.dart';
import 'package:dttv/src/pages/home/component/item.dart';
import 'package:dttv/src/pages/home/component/my_home_page.dart';
import 'package:dttv/src/pages/home/component/page_view.dart';
import 'package:dttv/src/pages/home/component/test.dart';
import 'package:dttv/src/pages/home/component/test1.dart';
import 'package:dttv/src/pages/home/home_controller.dart';

import 'package:dttv/src/pages/home/component/test_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    double checkBoxSize = computeCheckBoxSize(context);
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: ListView.builder(
    //       physics: const NeverScrollableScrollPhysics(),
    //       itemCount: 100,
    //       shrinkWrap: true,
    //       itemBuilder: (context, index) {
    //         return SizedBox(
    //           width: Get.width,
    //           height: 125,
    //           child: Stack(
    //             children: [
    //               Positioned(
    //                 left: index % 2 == 0
    //                     ? doubleInRange(random, 16, (Get.width / 2) - 16)
    //                     : 0,
    //                 right: index % 2 == 0
    //                     ? 0
    //                     : doubleInRange(random, 16, (Get.width / 2) - 16),
    //                 child: Align(
    //                   alignment: index % 2 == 0
    //                       ? Alignment.centerLeft
    //                       : Alignment.centerRight,
    //                   child: Container(
    //                     decoration: BoxDecoration(
    //                         gradient: LinearGradient(colors: [
    //                           Color((math.Random().nextDouble() * 0xFFFFFF)
    //                                   .toInt())
    //                               .withOpacity(1.0),
    //                           Color((math.Random().nextDouble() * 0xFFFFFF)
    //                                   .toInt())
    //                               .withOpacity(1.0)
    //                         ]),
    //                         borderRadius: BorderRadius.only(
    //                           topLeft: Radius.circular(
    //                               doubleInRange(random, 20, 40)),
    //                           bottomLeft: Radius.circular(
    //                               doubleInRange(random, 25, 55)),
    //                           bottomRight: Radius.circular(
    //                               doubleInRange(random, 15, 35)),
    //                           topRight: Radius.circular(
    //                               doubleInRange(random, 25, 50)),
    //                         )),
    //                     margin:
    //                         EdgeInsets.only(top: doubleInRange(random, 16, 32)),
    //                     constraints: BoxConstraints(
    //                       minHeight: doubleInRange(random, 45, 80),
    //                       maxHeight: doubleInRange(random, 85, 125),
    //                       maxWidth: doubleInRange(random, 85, 125),
    //                       minWidth: doubleInRange(random, 45, 80),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
    return Scaffold(body: AddToFave());
    // body: LayoutBuilder(
    //   builder: (context, constraints) {
    //     final height = constraints.biggest.height;
    //     final width = constraints.biggest.width;
    //     return SingleChildScrollView(
    //       child: SizedBox(
    //         height: Get.height * 7,
    //         child: Stack(
    //           children: [
    // Container(color: Colors.amber.shade100),
    // Positioned.fill(
    //     child: CustomPaint(painter: TestPathPainter())),
    // ListView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemCount: points.length,
    //   padding: EdgeInsets.zero,
    //   reverse: true,
    //   itemBuilder: (context, index) {
    //     return Positioned(
    //       left: points[index].dx * width - checkBoxSize / 2,
    //       top: points[index].dy * height - checkBoxSize / 2,
    //       child: InkWell(
    //         onTap: () => print('==>'),
    //         child: Container(
    //           width: checkBoxSize * 1.5,
    //           height: checkBoxSize * 1.5,
    //           decoration: BoxDecoration(
    //             gradient: LinearGradient(
    //               begin: Alignment.topRight,
    //               end: Alignment.bottomLeft,
    //               colors: [
    //                 Color((math.Random().nextDouble() * 0xFFFFFF)
    //                         .toInt())
    //                     .withOpacity(1.0),
    //                 Color((math.Random().nextDouble() * 0xFFFFFF)
    //                         .toInt())
    //                     .withOpacity(1.0),
    //                 Color((math.Random().nextDouble() * 0xFFFFFF)
    //                         .toInt())
    //                     .withOpacity(1.0),
    //               ],
    //             ),
    //             borderRadius: const BorderRadius.all(
    //               Radius.circular(10.0),
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // ),
    // ...points.map((point) {
    //   int index = points.indexOf(point);
    //   return Positioned(
    //     left: point.dx * width - checkBoxSize / 2,
    //     top: point.dy * height - checkBoxSize / 2,
    //     child: InkWell(
    //       onTap: () => print('==> $point'),
    //       child: Container(
    //         width: checkBoxSize * 1.5,
    //         height: checkBoxSize * 1.5,
    //         alignment: Alignment.center,
    //         decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //             begin: Alignment.topRight,
    //             end: Alignment.bottomLeft,
    //             colors: [
    //               Color((math.Random().nextDouble() * 0xFFFFFF)
    //                       .toInt())
    //                   .withOpacity(1.0),
    //               Color((math.Random().nextDouble() * 0xFFFFFF)
    //                       .toInt())
    //                   .withOpacity(1.0),
    //               Color((math.Random().nextDouble() * 0xFFFFFF)
    //                       .toInt())
    //                   .withOpacity(1.0),
    //             ],
    //           ),
    //           borderRadius: const BorderRadius.all(
    //             Radius.circular(10.0),
    //           ),
    //         ),
    //         child: Text('-$index-'),
    //       ),
    //     ),
    //   );
    // }).toList(),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}

double doubleInRange(Random source, dynamic start, dynamic end) =>
    source.nextDouble() * (end - start) + start;
double computeCheckBoxSize(BuildContext context) {
  final ThemeData themeData = Theme.of(context);
  final MaterialTapTargetSize effectiveMaterialTapTargetSize =
      themeData.checkboxTheme.materialTapTargetSize ??
          themeData.materialTapTargetSize;
  final VisualDensity effectiveVisualDensity =
      themeData.checkboxTheme.visualDensity ?? themeData.visualDensity;
  Size size;
  switch (effectiveMaterialTapTargetSize) {
    case MaterialTapTargetSize.padded:
      size = const Size(kMinInteractiveDimension, kMinInteractiveDimension);
      break;
    case MaterialTapTargetSize.shrinkWrap:
      size = const Size(
          kMinInteractiveDimension - 8.0, kMinInteractiveDimension - 8.0);
      break;
  }
  size += effectiveVisualDensity.baseSizeAdjustment;
  return size.longestSide;
}
