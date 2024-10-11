import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class AnimatedOpacityWidgetExample extends StatefulWidget {
  const AnimatedOpacityWidgetExample({super.key});

  @override
  State<AnimatedOpacityWidgetExample> createState() =>
      AnimatedOpacityWidgetExampleState();
}

class AnimatedOpacityWidgetExampleState
    extends State<AnimatedOpacityWidgetExample> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    const code = '''
void _changeOpacity() {
  setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
}

AnimatedOpacity(
  opacity: opacityLevel,
  duration: const Duration(seconds: 1),
  child: const FlutterLogo(),

ElevatedButton(
  onPressed: _changeOpacity,
  child: const Text('Fade Logo'),
),
),
    ''';
    return SingleChildScrollView(
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
          AnimatedOpacity(
            opacity: opacityLevel,
            duration: const Duration(seconds: 1),
            child: const FlutterLogo(
              size: 200,
            ),
          ),
          ElevatedButton(
            onPressed: _changeOpacity,
            child: const Text('Fade Logo'),
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
