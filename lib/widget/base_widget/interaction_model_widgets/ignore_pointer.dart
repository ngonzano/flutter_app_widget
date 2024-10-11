import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class IgnorePointerApp extends StatelessWidget {
  const IgnorePointerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('IgnorePointer Sample'),
        ),
        body: const Center(child: IgnorePointerExample()),
      ),
    );
  }
}

class IgnorePointerExample extends StatefulWidget {
  const IgnorePointerExample({super.key});

  @override
  State<IgnorePointerExample> createState() => _IgnorePointerExampleState();
}

class _IgnorePointerExampleState extends State<IgnorePointerExample> {
  bool ignoring = false;
  void setIgnoring(bool newValue) {
    setState(() {
      ignoring = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    const code = '''
bool ignoring = false;
void setIgnoring(bool newValue) {
  setState(() {
    ignoring = newValue;
  });
}
//...
IgnorePointer(
  ignoring: ignoring,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(24.0),
    ),
    onPressed: () {},
    child: const Text('Click me!'),
  ),
),
FilledButton(
  onPressed: () {
    setIgnoring(!ignoring);
  },
  child: Text(
    ignoring ? 'Set ignoring to false' : 'Set ignoring to true',
  ),
),
    ''';
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
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
          Text('Ignoring: $ignoring'),
          IgnorePointer(
            ignoring: ignoring,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(24.0),
              ),
              onPressed: () {},
              child: const Text('Click me!'),
            ),
          ),
          FilledButton(
            onPressed: () {
              setIgnoring(!ignoring);
            },
            child: Text(
              ignoring ? 'Set ignoring to false' : 'Set ignoring to true',
            ),
          ),
        ],
      ),
    );
  }
}
