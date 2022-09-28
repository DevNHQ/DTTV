import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleAnimation extends StatefulWidget {
  SampleAnimation();

  @override
  State<StatefulWidget> createState() {
    return SampleAnimationState();
  }
}

class SampleAnimationState extends State<SampleAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animation;
  Path? _path;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    super.initState();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    _controller?.forward();
    _path = drawPath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: CustomPaint(
              painter: PathPainter(_path!),
            ),
          ),
          Positioned(
            top: calculate(_animation?.value).dy,
            left: calculate(_animation?.value).dx,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10)),
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Path drawPath() {
    Size size = Size(Get.width, Get.height);
    Path path = Path();
    path.moveTo(50, 50);
    path.quadraticBezierTo(0, size.height, size.width - 16, size.height - 16);
    path.moveTo(size.width - 16, 0);
    path.quadraticBezierTo(0, size.height, size.height - 16, size.height - 16);
    return path;
  }

  Offset calculate(value) {
    PathMetrics pathMetrics = _path!.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent pos = pathMetric.getTangentForOffset(value)!;
    return pos.position;
  }
}

class PathPainter extends CustomPainter {
  Path path;

  PathPainter(this.path);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawPath(this.path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
