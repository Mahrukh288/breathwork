import 'package:flutter/material.dart';

import 'curve_painter.dart';

class MyPainter extends StatefulWidget {
  const MyPainter({Key? key, required this.width, required this.height})
      : super(key: key);

  final double width;
  final double height;
  @override
  State<MyPainter> createState() => _MyPainterState();
}

class _MyPainterState extends State<MyPainter> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Tween<double> rotationTween = Tween(begin: 0, end: 500);

  @override
  void initState() {
    // rotationTween = Tween(begin: 0, end: 500);
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));

    animation = rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: CustomPaint(painter: CurvePainter(animation)),
    );
  }
}
