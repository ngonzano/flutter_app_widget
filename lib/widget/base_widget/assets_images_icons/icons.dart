import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class IconsScreen extends StatelessWidget {
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
Icon(
  Icons.favorite,
  color: Colors.pink,
  size: 24.0,
  semanticLabel: 'Text to announce in accessibility modes',
),
Icon(
  Icons.audiotrack,
  color: Colors.green,
  size: 30.0,
),
Icon(
  Icons.beach_access,
  color: Colors.blue,
  size: 36.0,
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Icon(
                  Icons.audiotrack,
                  color: Colors.green,
                  size: 30.0,
                ),
                Icon(
                  Icons.beach_access,
                  color: Colors.blue,
                  size: 36.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
