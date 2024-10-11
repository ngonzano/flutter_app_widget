import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget_page.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class RotatedBoxExample extends StatelessWidget {
  const RotatedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de RotatedBox'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: const ValueKey('RotatedBox'),
        child: const Icon(Icons.code),
        onPressed: () {
          Navigator.push(
              context,
              createFadePageRouteBuilder(
                  page: Scaffold(
                    appBar: AppBar(
                      title: const Text('Ejemplo de RotatedBox'),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          HighlightView(
                            '''
body: const Center(
  child: RotatedBox(
    quarterTurns: 1,
    child: Text('Hello World!'),
  ),
)                               
                                  ''',
                            language: 'dart', // Especifica que es código Dart
                            theme: atomOneDarkTheme,
                            padding: const EdgeInsets.all(2.0),
                            textStyle: const TextStyle(
                              fontFamily: 'Courier', // Fuente monoespaciada
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  name: 'RotatedBox'));
        },
      ),
      body: const Center(
        child: RotatedBox(
          quarterTurns: 1,
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
