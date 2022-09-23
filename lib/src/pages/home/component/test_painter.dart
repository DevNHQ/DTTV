import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';

class TestPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..color = Colors.black;
    paint.shader = LinearGradient(colors: [
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
    ], begin: Alignment.centerRight, end: Alignment.centerLeft)
        .createShader(const Offset(0.0, 0.0) & size);
    // canvas.drawRect(const Offset(0.0, 0.0) & size, paint);
    final path = Path()
      ..moveTo(
        points[0].dx * size.width,
        points[0].dy * (size.height / 7),
      );
    points.sublist(1).forEach(
          (point) => path.lineTo(
            point.dx * size.width,
            point.dy * (size.height / 7),
          ),
        );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TestPathPainter oldDelegate) => false;
}

final random = Random();
final List<Offset> points = List.generate(
  50,
  (index) => Offset(.1 + random.nextDouble() * .8, .1 + index * .8 / 7),
);
double doubleInRange(Random source, dynamic start, dynamic end) =>
    source.nextDouble() * (end - start) + start;
