import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class AnimatedPositionedExampleApp extends StatelessWidget {
  const AnimatedPositionedExampleApp({super.key});

  static const Duration duration = Duration(seconds: 2);
  static const Curve curve = Curves.fastOutSlowIn;

  @override
  Widget build(BuildContext context) {
    const code = '''
AnimatedPositioned(
  width: selected ? 200.0 : 50.0,
  height: selected ? 50.0 : 200.0,
  top: selected ? 50.0 : 150.0,
  duration: widget.duration,
  curve: widget.curve,
  child: GestureDetector(
    onTap: () {
      setState(() {
        selected = !selected;
      });
    },
    child: const ColoredBox(
      color: Colors.blue,
      child: Center(child: Text('Tap me')),
    ),
  ),
),
    ''';
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AnimatedPositioned Sample')),
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
                const AnimatedPositionedExample(
                  duration: duration,
                  curve: curve,
                ),
                const SizedBox(height: 100)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({
    required this.duration,
    required this.curve,
    super.key,
  });

  final Duration duration;

  final Curve curve;

  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 350,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: selected ? 200.0 : 50.0,
            height: selected ? 50.0 : 200.0,
            top: selected ? 50.0 : 150.0,
            duration: widget.duration,
            curve: widget.curve,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: const ColoredBox(
                color: Colors.blue,
                child: Center(child: Text('Tap me')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
