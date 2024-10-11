import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class AnimatedBuilderExampleApp extends StatelessWidget {
  const AnimatedBuilderExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
    //
    class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
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
    //
AnimatedBuilder(
  animation: _controller,
  child: Material(
    child: Container(
      width: 200.0,
      height: 200.0,
      color: Colors.green,
      child: const Center(
        child: Text('Rueda!'),
      ),
    ),
  ),
  builder: (BuildContext context, Widget? child) {
    return Transform.rotate(
      angle: _controller.value * 2.0 * math.pi,
      child: child,
    );
  },
)
    ''';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            const AnimatedBuilderExample(),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
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
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: _controller.value * 2.0 * math.pi,
              child: child,
            );
          },
        ),
        const Center(
          child: Material(
              child: Text(
            'Rueda!',
            style: TextStyle(backgroundColor: Colors.green),
          )),
        ),
      ],
    );
  }
}
