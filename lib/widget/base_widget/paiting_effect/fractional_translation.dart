import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget_page.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class FractionalTranslationExample extends StatelessWidget {
  const FractionalTranslationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de FractionalTranslation'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: const ValueKey('FractionalTranslation'),
        child: const Icon(Icons.code),
        onPressed: () {
          Navigator.push(
              context,
              createFadePageRouteBuilder(
                  page: Scaffold(
                    appBar: AppBar(
                      title: const Text('Ejemplo de FractionalTranslation'),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          HighlightView(
                            '''
body: Center(
  child: FractionalTranslation(
    translation: const Offset(1, -1), // Desplazamiento fraccional
    child: Container(
      width: 100.0,
      height: 100.0,
      color: Colors.blue,
    ),
  ),
),   
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
                  name: 'FractionalTranslation'));
        },
      ),
      body: Center(
        child: FractionalTranslation(
          translation: const Offset(1, -1), // Desplazamiento fraccional
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
