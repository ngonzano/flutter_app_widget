import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class SizeTransitionExampleApp extends StatelessWidget {
  const SizeTransitionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SizeTransitionExample(),
    );
  }
}

class SizeTransitionExample extends StatefulWidget {
  const SizeTransitionExample({super.key});

  @override
  State<SizeTransitionExample> createState() => _SizeTransitionExampleState();
}

class _SizeTransitionExampleState extends State<SizeTransitionExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
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
  duration: const Duration(seconds: 3),
  vsync: this,
)..repeat();
late final Animation<double> _animation = CurvedAnimation(
  parent: _controller,
  curve: Curves.fastOutSlowIn,
);
//...
SizeTransition(
  sizeFactor: _animation,
  axis: Axis.horizontal,
  axisAlignment: -1,
  child: const Center(
    child: FlutterLogo(size: 200.0),
  ),
),
    ''';
    return Scaffold(
      body: SingleChildScrollView(
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
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.horizontal,
              axisAlignment: -1,
              child: const Center(
                child: FlutterLogo(size: 200.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
