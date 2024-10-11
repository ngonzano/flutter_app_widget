import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class ClipRRectExample extends StatelessWidget {
  const ClipRRectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: const ValueKey('ClipRRect'),
        child: const Icon(Icons.code),
        onPressed: () {
          Navigator.push(
              context,
              createFadePageRouteBuilder(
                  page: Scaffold(
                    appBar: AppBar(
                      title: const Text('Ejemplo de ClipRRect'),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          HighlightView(
                            '''
body: Center(
  child: ClipRRect(
    borderRadius:
        BorderRadius.circular(20.0), // Ajusta el radio del borde
    child: Image.network(
      'https://via.placeholder.com/300', // Reemplaza con la URL de tu imagen
      width: 300.0,
      height: 200.0,
      fit: BoxFit.cover,
    ),
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
                  name: 'ClipRRect'));
        },
      ),
      body: Center(
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(20.0), // Ajusta el radio del borde
          child: Image.network(
            'https://via.placeholder.com/300', // Reemplaza con la URL de tu imagen
            width: 300.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
