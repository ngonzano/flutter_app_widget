import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class RotationTransitionExampleApp extends StatelessWidget {
  const RotationTransitionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RotationTransitionExample(),
    );
  }
}

class RotationTransitionExample extends StatefulWidget {
  const RotationTransitionExample({super.key});

  @override
  State<RotationTransitionExample> createState() =>
      _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const code = '''
late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );
//...
RotationTransition(
  turns: _animation,
  child: const Padding(
    padding: EdgeInsets.all(8.0),
    child: FlutterLogo(size: 150.0),
  ),
)
    ''';
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
              RotationTransition(
                turns: _animation,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlutterLogo(size: 150.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
