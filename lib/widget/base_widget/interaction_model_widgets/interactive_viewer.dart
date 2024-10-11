import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class InteractiveViewerExampleApp extends StatelessWidget {
  const InteractiveViewerExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
return InteractiveViewer(
  boundaryMargin: const EdgeInsets.all(20.0),
  minScale: 0.1,
  maxScale: 1.6,
  child: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[Colors.orange, Colors.red],
        stops: <double>[0.0, 1.0],
      ),
    ),
  ),
);
    ''';
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('InteractiveViewer Sample')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HighlightView(
                code,
                language: 'dart', // Especifica que es código Dart
                theme: atomOneDarkTheme,
                padding: const EdgeInsets.all(12.0),
                textStyle: const TextStyle(
                  fontFamily: 'Courier', // Fuente monoespaciada
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                child: const InteractiveViewerExample(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InteractiveViewerExample extends StatelessWidget {
  const InteractiveViewerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      boundaryMargin: const EdgeInsets.all(20.0),
      minScale: 0.1,
      maxScale: 1.6,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.orange, Colors.red],
            stops: <double>[0.0, 1.0],
          ),
        ),
      ),
    );
  }
}
