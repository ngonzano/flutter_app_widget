import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class ImplicitlyAnimatedWidgetExample extends StatefulWidget {
  const ImplicitlyAnimatedWidgetExample({super.key});

  @override
  State<ImplicitlyAnimatedWidgetExample> createState() =>
      _ImplicitlyAnimatedWidgetExampleState();
}

class _ImplicitlyAnimatedWidgetExampleState
    extends State<ImplicitlyAnimatedWidgetExample> {
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    const code = '''
TweenAnimationBuilder , que anima cualquier propiedad expresada por un Tween a un valor objetivo especificado.
AnimatedAlign , que es una versión animada implícitamente de Align .
AnimatedContainer , que es una versión animada implícitamente de Container .
AnimatedDefaultTextStyle , que es una versión animada implícitamente de DefaultTextStyle .
AnimatedScale , que es una versión animada implícitamente de Transform.scale .
AnimatedRotation , que es una versión animada implícitamente de Transform.rotate .
AnimatedSlide , que anima implícitamente la posición de un widget en relación con su posición normal.
AnimatedOpacity , que es una versión animada implícitamente de Opacity .
AnimatedPadding , que es una versión animada implícitamente de Padding .
AnimatedPhysicalModel , que es una versión animada implícitamente de PhysicalModel .
AnimatedPositioned , que es una versión animada implícitamente de Positioned .
AnimatedPositionedDirectional , que es una versión animada implícitamente de PositionedDirectional .
AnimatedTheme , que es una versión animada implícitamente de Theme .
AnimatedCrossFade , que realiza una transición cruzada entre dos elementos secundarios determinados y se anima a sí mismo entre sus tamaños.
AnimatedSize , que cambia automáticamente de tamaño durante una duración determinada.
AnimatedSwitcher , que se desvanece de un widget a otro.
    ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImplicitlyAnimatedWidget Example'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HighlightView(
                code,
                language: 'dart', // Especifica que es código Dart
                theme: friendlyTheme,
                padding: const EdgeInsets.all(12.0),
                textStyle: const TextStyle(
                  fontFamily: 'Courier', // Fuente monoespaciada
                  fontSize: 16.0,
                ),
              ),
              AnimatedContainer(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _width = _width == 100.0 ? 200.0 : 100.0;
                    _height = _height == 100.0 ? 200.0 : 100.0;
                    _color = _color == Colors.blue ? Colors.red : Colors.blue;
                    _borderRadius = _borderRadius == BorderRadius.circular(8.0)
                        ? BorderRadius.circular(20.0)
                        : BorderRadius.circular(8.0);
                  });
                },
                child: const Text('Animar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
