import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class AnimatedDefaultTextStyleExample extends StatefulWidget {
  const AnimatedDefaultTextStyleExample({super.key});

  @override
  AnimatedDefaultTextStyleExampleState createState() =>
      AnimatedDefaultTextStyleExampleState();
}

class AnimatedDefaultTextStyleExampleState
    extends State<AnimatedDefaultTextStyleExample> {
  bool _firstTextStyle = true;

  @override
  Widget build(BuildContext context) {
    const code = '''
    AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 300),
      style: _firstTextStyle
          ? const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            )
          : const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w200,
              color: Colors.red,
            ),
      child: const Text('Flutter'),
    )
    ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedDefaultTextStyle'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            SizedBox(
              height: 100,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: _firstTextStyle
                    ? const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      )
                    : const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.red,
                      ),
                child: const Text('Flutter'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _firstTextStyle = !_firstTextStyle;
                });
              },
              child: const Text('Cambiar Estilo'),
            ),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
