import 'package:flutter/material.dart';

class DottedBackgroundPainter extends CustomPainter {
  final double dotRadius;
  final double dotSpacing;
  final Color dotColor;

  DottedBackgroundPainter({
    this.dotRadius = 0.5,
    this.dotSpacing = 20.0,
    this.dotColor = const Color(0xffdcdcdc),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = dotColor;

    for (double i = 0; i < size.width; i += dotSpacing) {
      for (double j = 0; j < size.height; j += dotSpacing) {
        canvas.drawCircle(Offset(i, j), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
