import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class ClipPathExample extends StatelessWidget {
  const ClipPathExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de ClipPath'),
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
  child: ClipPath(
    clipper: MyCustomClipper(),
    child: Image.network(
      'https://picsum.photos/300/300', // Reemplaza con tu URL de imagen
      width: 200,
      height: 200,
      fit: BoxFit.cover,
    ),
  ),
),
//
class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
                                  
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
        child: ClipPath(
          clipper: MyCustomClipper(),
          child: Image.network(
            'https://picsum.photos/300/300', // Reemplaza con tu URL de imagen
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
