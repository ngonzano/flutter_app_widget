import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class ImageNetworkScreen extends StatelessWidget {
  const ImageNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
Image(
  image: NetworkImage(
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
),
    ''';
    return Scaffold(
      body: SingleChildScrollView(
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
            const Image(
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
