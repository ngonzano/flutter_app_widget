import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
assets:
  - assets/
  - assets/images/
//...
Image.asset(
  'assets/images/image.png', // Ruta de la imagen en la carpeta assets
  bundle: DefaultAssetBundle.of(context), // Accede al AssetBundle
),
    ''';
    return SingleChildScrollView(
      child: Column(
        children: [
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
          Image.asset(
            'assets/images/image.png', // Ruta de la imagen en la carpeta assets
            bundle: DefaultAssetBundle.of(context), // Accede al AssetBundle
          ),
        ],
      ),
    );
  }
}
