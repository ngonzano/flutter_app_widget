import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});

  @override
  State<AnimatedCrossFadeExample> createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool _showFirstChild = true;

  @override
  Widget build(BuildContext context) {
    const code = '''
    AnimatedCrossFade(
          duration: const Duration(seconds: 1),
          firstChild: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Primer Widget',
                style: TextStyle(
                  fontSize: 20, 
                  color: Colors.white,
                  ),
              ),
            ),
          ),
          secondChild: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.red,
            child: const Center(
              child: Text(
                'Segundo Widget',
                style: TextStyle(
                    fontSize: 20, 
                    color: Colors.white),
              ),
            ),
          ),
          crossFadeState: _showFirstChild
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        )
    ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrossFade'),
      ),
      body: Center(
        child: SingleChildScrollView(
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
              AnimatedCrossFade(
                duration: const Duration(seconds: 1),
                firstChild: Container(
                  height: 200.0,
                  width: 200.0,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Primer Widget',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                secondChild: Container(
                  height: 200.0,
                  width: 200.0,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Segundo Widget',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                crossFadeState: _showFirstChild
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showFirstChild = !_showFirstChild;
                  });
                },
                child: const Text('Cambiar Widget'),
              ),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
