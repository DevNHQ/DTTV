import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class CursorPainter extends CustomClipper<Path> {
  CursorPainter({this.points = 8});

  /// The number of points of the star
  final int points;

  @override
  Path getClip(Size size) {
    double width = size.width;
    double halfWidth = width / 2;

    double bigRadius = halfWidth;

    double radius = halfWidth / 1.25;

    double degreesPerStep = _degToRad(360 / points);

    double halfDegreesPerStep = degreesPerStep / 2;

    var path = Path();

    double max = 2 * math.pi;

    path.moveTo(width, halfWidth);
    for (double step = 0; step < max; step += degreesPerStep) {
      path.lineTo(halfWidth + bigRadius * math.cos(step),
          halfWidth + bigRadius * math.sin(step));
      path.arcToPoint(
          Offset(
            halfWidth + bigRadius * math.cos(step),
            halfWidth + bigRadius * math.sin(step),
          ),
          radius: const Radius.circular(50));
      path.lineTo(halfWidth + radius * math.cos(step + halfDegreesPerStep),
          halfWidth + radius * math.sin(step + halfDegreesPerStep));
      path.arcToPoint(
          Offset(
            halfWidth + radius * math.cos(step + halfDegreesPerStep),
            halfWidth + radius * math.sin(step + halfDegreesPerStep),
          ),
          radius: const Radius.circular(50));
    }

    path.close();
    return path;
  }

  double _degToRad(num deg) => deg * (math.pi / 180.0);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    CursorPainter oldie = oldClipper as CursorPainter;
    return points != oldie.points;
  }
}
