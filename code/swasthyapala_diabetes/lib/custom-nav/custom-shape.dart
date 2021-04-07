import 'package:flutter/material.dart';

class PaintDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amberAccent, child: CustomBtmNavUI());
  }
}

class CustomBtmNavUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: UIPainter(),
    );
  }
}

class UIPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();
    path.moveTo(size.width * 0.4, size.height * 0.6);
    path.lineTo(size.width * 0.4, size.height * 0.5);
    path.lineTo(size.width * 0.5, size.height * 0.55);
    path.lineTo(size.width * 0.6, size.height * 0.5);
    path.lineTo(size.width * 0.6, size.height * 0.6);
    path.moveTo(size.width * 0.6, size.height * 0.6);
    path.close();
    path.moveTo(size.width * 0.4, size.height * 0.4);
    path.lineTo(size.width * 0.5, size.height * 0.3);
    path.lineTo(size.width * 0.6, size.height * 0.4);
    path.moveTo(size.width * 0.425, size.height * 0.365);
    path.lineTo(size.width * 0.575, size.height * 0.365);
    path.close();

    path.moveTo(size.width * 0.4, size.height * 0.65);
    path.lineTo(size.width * 0.4, size.height * 0.75);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
