import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget_page.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class DecoratedBoxExample extends StatelessWidget {
  const DecoratedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de DecoratedBox'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: const ValueKey('ClipOval'),
        child: const Icon(Icons.code),
        onPressed: () {
          Navigator.push(
              context,
              createFadePageRouteBuilder(
                  page: Scaffold(
                    appBar: AppBar(
                      title: const Text('Ejemplo de ClipOval'),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          HighlightView(
                            '''
body: Center(
  child: DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.blue, // Color de fondo
      border: Border.all(
        color: Colors.red, // Color del borde
        width: 5.0, // Ancho del borde
      ),
      borderRadius:
          BorderRadius.circular(20.0), // Radio del borde redondeado
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), // Color de la sombra
          spreadRadius: 5, // Difusión de la sombra
          blurRadius: 7, // Desenfoque de la sombra
          offset: const Offset(0, 3), // Desplazamiento de la sombra
        ),
      ],
      gradient: const LinearGradient(
        begin: Alignment.topLeft, // Inicio del degradado
        end: Alignment.bottomRight, // Fin del degradado
        colors: [
          Colors.yellow, // Color inicial del degradado
          Colors.orange, // Color final del degradado
        ],
      ),
      image: const DecorationImage(
        image: NetworkImage(
          'https://via.placeholder.com/300', // Reemplaza con la URL de tu imagen
        ),
        fit: BoxFit.cover, // Cómo se ajusta la imagen
      ),
    ),
    child: const SizedBox(
      width: 200.0,
      height: 100.0,
      child: Center(
        child: Text(
          'DecoratedBox',
          style: TextStyle(
            color: Colors.white, // Color del texto
            fontSize: 20.0, // Tamaño del texto
          ),
        ),
      ),
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
                  name: 'ClipOval'));
        },
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blue, // Color de fondo
            border: Border.all(
              color: Colors.red, // Color del borde
              width: 5.0, // Ancho del borde
            ),
            borderRadius:
                BorderRadius.circular(20.0), // Radio del borde redondeado
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Color de la sombra
                spreadRadius: 5, // Difusión de la sombra
                blurRadius: 7, // Desenfoque de la sombra
                offset: const Offset(0, 3), // Desplazamiento de la sombra
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.topLeft, // Inicio del degradado
              end: Alignment.bottomRight, // Fin del degradado
              colors: [
                Colors.yellow, // Color inicial del degradado
                Colors.orange, // Color final del degradado
              ],
            ),
            // image: const DecorationImage(
            //   image: NetworkImage(
            //     'https://via.placeholder.com/300', // Reemplaza con la URL de tu imagen
            //   ),
            //   fit: BoxFit.cover, // Cómo se ajusta la imagen
            // ),
          ),
          child: const SizedBox(
            width: 200.0,
            height: 100.0,
            child: Center(
              child: Text(
                'DecoratedBox',
                style: TextStyle(
                  color: Colors.white, // Color del texto
                  fontSize: 20.0, // Tamaño del texto
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
