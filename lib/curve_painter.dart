import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  final Animation<double> animation;
  CurvePainter(this.animation) : super(repaint: animation) {
    print('created');
  }

  Path _createLine(Size size) {
    var path = Path();
//x = point, y =  width of line
    path.moveTo(0, 50);
    path.lineTo(animation.value < 100 ? 100 - animation.value : 0, 50);

    path.relativeCubicTo(50 - animation.value, 0, 2 * (50 - animation.value),
        4 * (50 - animation.value), 4 * (50 - animation.value), 0);

    path.relativeLineTo(animation.value >= 300 ? animation.value : 0, 0);

    // if (animation.value <= 250) {
    //   path.lineTo(100, 50);
    //   //path.relativeQuadraticBezierTo(50, 0, 100, 0);
    //   path.relativeCubicTo(50, 0, 100, 200, 400, 0);
    // } else if (animation.value > 250 && animation.value <= 350) {
    //   path.relativeCubicTo(50, 0, 100, 200, 300, 0);
    //   path.relativeLineTo(50, 0);
    // } else {
    //   path.relativeCubicTo(50, 0, 0, 0, 400, 0);
    //   path.relativeLineTo(200, 0);
    // }
    // path.relativeCubicTo(
    //     50,
    //     0,
    //     300,
    //     animation.value > 100 && animation.value <= 300 ? 100 : 0,
    //     animation.value > 100 ? 400 : 0,
    //     0);
    // path.relativeLineTo(animation.value >= 450 ? 50 : 0, 0);
    //path.relativeCubicTo(200, 0, 300, 400, 600, 10);
    // Offset arc = Offset(50, 0);
    // path.relativeArcToPoint(arc);
    // path.relativeCubicTo(50, -80, 300, 0, 300, -40);
    //path.reset();
    // path.re
    //path.relativeQuadraticBezierTo(100, 100, size.width, 0);
    //path.lineTo(size.width, 50);
    // path.relativeCubicTo(200, 0, 0, 0, 0, 0);
    //path.relativeLineTo(100, 0);

    // path.moveTo(0, size.height * 0.25);
    // path.lineTo(size.width / 4, size.height * 0.25);
    // path.relativeCubicTo(
    //     size.width / 4, 0, size.width / 4 + 3, size.height / 2, size.width, 0);
    //path.relativeLineTo(size.width, 0);

    //path.relativeCubicTo(x1, y1, x2, y2, x3, y3)

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //print(size);
    //print(animation.value);
    Size mySize = Size(animation.value, animation.value);
    final animationPercent = animation.value;

    var paint = Paint();
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;
    final path = _createLine(size);

    // path.cubicTo(size.width / 2, size.height / 2, size.width / 2 + 3,
    //     size.height / 2, size.width, size.height * 0.25);
    // path.quadraticBezierTo(
    //     size.width / 2, size.height / 2, size.width, size.height * 0.25);
    //path.lineTo(0, 0);
    canvas.drawPath(path, paint);
    final pathMetric = path.computeMetrics().elementAt(0);
    final value = animation.value;
    final pos = pathMetric.getTangentForOffset(value);

    paint.style = PaintingStyle.fill;
    Offset center = Offset(animation.value / 9, 50);
    canvas.drawCircle(pos!.position, 5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
