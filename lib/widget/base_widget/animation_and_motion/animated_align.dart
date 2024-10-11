import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class AnimatedAlignExampleApp extends StatelessWidget {
  const AnimatedAlignExampleApp({super.key});

  static const Duration duration = Duration(seconds: 1);
  static const Curve curve = Curves.fastOutSlowIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('AnimatedAlign')),
        body: const AnimatedAlignExample(
          duration: duration,
          curve: curve,
        ),
      ),
    );
  }
}

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({
    required this.duration,
    required this.curve,
    super.key,
  });

  final Duration duration;

  final Curve curve;

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    const code = '''
    AnimatedAlign(
      alignment: selected 
        ? Alignment.topRight 
        : Alignment.bottomLeft,
      duration: widget.duration,
      curve: widget.curve,
      child: const FlutterLogo(size: 50.0),
    );
    ''';
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
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
              Container(
                width: 250.0,
                height: 250.0,
                color: Colors.red,
                child: AnimatedAlign(
                  alignment:
                      selected ? Alignment.topRight : Alignment.bottomLeft,
                  duration: widget.duration,
                  curve: widget.curve,
                  child: const FlutterLogo(size: 50.0),
                ),
              ),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
