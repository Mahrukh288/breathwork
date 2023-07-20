import 'package:flutter/material.dart';

class DotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.blueAccent;

    paint.strokeWidth = 15.0;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
