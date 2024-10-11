import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class AnimatedSizeExampleApp extends StatelessWidget {
  const AnimatedSizeExampleApp({super.key});

  static const Duration duration = Duration(seconds: 1);
  static const Curve curve = Curves.easeIn;

  @override
  Widget build(BuildContext context) {
    const code = '''
AnimatedSize(
  duration: widget.duration,
  curve: widget.curve,
  child: SizedBox.square(
    dimension: _isSelected ? 250.0 : 100.0,
    child: const Center(
      child: FlutterLogo(size: 75.0),
    ),
  ),
),
    ''';
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AnimatedSize Sample')),
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
                const AnimatedSizeExample(
                  duration: duration,
                  curve: curve,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedSizeExample extends StatefulWidget {
  const AnimatedSizeExample({
    required this.duration,
    required this.curve,
    super.key,
  });

  final Duration duration;

  final Curve curve;

  @override
  State<AnimatedSizeExample> createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<AnimatedSizeExample> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: ColoredBox(
        color: Colors.amberAccent,
        child: AnimatedSize(
          duration: widget.duration,
          curve: widget.curve,
          child: SizedBox.square(
            dimension: _isSelected ? 250.0 : 100.0,
            child: const Center(
              child: FlutterLogo(size: 75.0),
            ),
          ),
        ),
      ),
    );
  }
}
