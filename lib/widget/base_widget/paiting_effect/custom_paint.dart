import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'dart:math' as math;

import 'package:flutter_highlight/themes/atom-one-dark.dart';

class CustomPaintExample extends StatelessWidget {
  const CustomPaintExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de CustomPaint'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: const ValueKey('ClipOval'),
        child: const Icon(Icons.code),
        onPressed: () {
          Navigator.push(
              context,
              createFadePageRouteBuilder(
                  page: Scaffold(
                    appBar: AppBar(
                      title: const Text('Ejemplo de CustomPaint'),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          HighlightView(
                            '''
body: Center(
  child: CustomPaint(
    size: const Size(200, 200),
    painter: MyPainter(),
  ),
),
//
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Dibujar un círculo rojo
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 50, paint);

    // Dibujar un cuadrado azul
    paint
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawRect(const Offset(20, 20) & const Size(80, 80), paint);

    // Dibujar una línea verde
    paint
      ..color = Colors.green
      ..strokeWidth = 5;
    canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);

    // Dibujar un arco iris
    const rect = Rect.fromLTWH(100, 100, 80, 80);
    const colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.pink
    ];
    for (int i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5;
      canvas.drawArc(
        rect,
        (i * math.pi / 3) - math.pi / 2,
        math.pi / 3,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
                                  
                                  ''',
                            language: 'dart', // Especifica que es código Dart
                            theme: atomOneDarkTheme,
                            padding: const EdgeInsets.all(2.0),
                            textStyle: const TextStyle(
                              fontFamily: 'Courier', // Fuente monoespaciada
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  name: 'CustomPaint'));
        },
      ),
      body: Center(
        child: CustomPaint(
          size: const Size(200, 200),
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Dibujar un círculo rojo
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 50, paint);

    // Dibujar un cuadrado azul
    paint
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawRect(const Offset(20, 20) & const Size(80, 80), paint);

    // Dibujar una línea verde
    paint
      ..color = Colors.green
      ..strokeWidth = 5;
    canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);

    // Dibujar un arco iris
    const rect = Rect.fromLTWH(100, 100, 80, 80);
    const colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.pink
    ];
    for (int i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5;
      canvas.drawArc(
        rect,
        (i * math.pi / 3) - math.pi / 2,
        math.pi / 3,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
