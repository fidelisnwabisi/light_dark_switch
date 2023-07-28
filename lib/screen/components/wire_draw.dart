import 'package:flutter/material.dart';
import 'package:light_dark_switch/app_theme.dart';
import 'package:provider/provider.dart';

class Wire extends StatelessWidget {
  const Wire(
      {super.key, required this.initialPosition, required this.toOffset});
  final Offset initialPosition;
  final Offset toOffset;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return CustomPaint(
      painter: WirePainter(
        initialPosition: initialPosition,
        toOffset: toOffset,
        themeProvider: themeProvider,
      ),
    );
  }
}

class WirePainter extends CustomPainter {
  final Offset initialPosition;
  final Offset toOffset;
  final ThemeProvider themeProvider;

  Paint? _paint;

  WirePainter(
      {required this.initialPosition,
      required this.toOffset,
      required this.themeProvider});
  @override
  void paint(Canvas canvas, Size size) {
    _paint = Paint()
      ..color = themeProvider.themeMode().switchColor!
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    canvas.drawLine(initialPosition, toOffset, _paint!);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

  // @override
  // bool shouldRepaint(WirePainter oldDelegate) => false;

  // @override
  // bool shouldRebuildSemantics(WirePainter oldDelegate) => false;
}
