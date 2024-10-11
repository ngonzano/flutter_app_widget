import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class AnimatedWidgetExampleApp extends StatelessWidget {
  const AnimatedWidgetExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({
    super.key,
    required AnimationController controller,
  }) : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(width: 200.0, height: 200.0, color: Colors.green),
    );
  }
}
//crear un controller luego llamar al widget
Widget build(BuildContext context) {
  return SpinningContainer(controller: _controller);
}


Usa AnimatedWidget cuando:

  Necesitas animar un solo widget.
  La animación está controlada por un solo Listenable.
  Quieres un código más limpio y reutilizable.

Considera usar AnimatedBuilder o StatefulWidget con setState() cuando:

  Necesitas coordinar animaciones con múltiples Listenable o eventos.
  Necesitas más flexibilidad en la lógica de animación.
    ''';
    return MaterialApp(
      home: SingleChildScrollView(
        child: Column(
          children: [
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
            const AnimatedWidgetExample(),
          ],
        ),
      ),
    );
  }
}

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({
    super.key,
    required AnimationController controller,
  }) : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(width: 200.0, height: 200.0, color: Colors.green),
    );
  }
}

class AnimatedWidgetExample extends StatefulWidget {
  const AnimatedWidgetExample({super.key});

  @override
  State<AnimatedWidgetExample> createState() => _AnimatedWidgetExampleState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _AnimatedWidgetExampleState extends State<AnimatedWidgetExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpinningContainer(controller: _controller);
  }
}
