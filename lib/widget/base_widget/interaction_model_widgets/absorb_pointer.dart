import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class AbsorbPointerApp extends StatelessWidget {
  const AbsorbPointerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AbsorbPointer Sample')),
        body: const Center(
          child: AbsorbPointerExample(),
        ),
      ),
    );
  }
}

class AbsorbPointerExample extends StatelessWidget {
  const AbsorbPointerExample({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
child: AbsorbPointer(
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red.shade200,
    ),
    onPressed: () {},
    child: null,
  ),
)
    ''';

    return SingleChildScrollView(
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
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              SizedBox(
                width: 200.0,
                height: 100.0,
                child: ElevatedButton(
                  onPressed: () {
                    print('swdfwsed');
                  },
                  child: null,
                ),
              ),
              SizedBox(
                width: 100.0,
                height: 200.0,
                child: AbsorbPointer(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade200,
                    ),
                    onPressed: () {
                      print('swdfwsed');
                    },
                    child: null,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
