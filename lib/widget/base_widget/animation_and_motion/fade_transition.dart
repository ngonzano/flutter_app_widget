import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class FadeTransitionExampleApp extends StatelessWidget {
  const FadeTransitionExampleApp({super.key});

  static const Duration duration = Duration(seconds: 2);
  static const Curve curve = Curves.easeIn;

  @override
  Widget build(BuildContext context) {
    const code = '''
late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  )..repeat(reverse: true);
  late final CurvedAnimation _animation = CurvedAnimation(
    parent: _controller,
    curve: widget.curve,
  );

//...
FadeTransition(
  opacity: _animation,
  child: const Padding(
    padding: EdgeInsets.all(8),
    child: FlutterLogo(),
  ),
),

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
            const FadeTransitionExample(
              duration: duration,
              curve: curve,
            ),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}

class FadeTransitionExample extends StatefulWidget {
  const FadeTransitionExample({
    required this.duration,
    required this.curve,
    super.key,
  });

  final Duration duration;

  final Curve curve;

  @override
  State<FadeTransitionExample> createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<FadeTransitionExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  )..repeat(reverse: true);
  late final CurvedAnimation _animation = CurvedAnimation(
    parent: _controller,
    curve: widget.curve,
  );

  @override
  void dispose() {
    _animation.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
