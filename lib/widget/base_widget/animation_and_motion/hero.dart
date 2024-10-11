import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class HeroApp extends StatelessWidget {
  const HeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HeroExample(),
    );
  }
}

class HeroExample extends StatelessWidget {
  const HeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
ListTile(
  leading: const Hero(
    tag: 'hero-rectangle',
    child: BoxWidget(size: Size(50.0, 50.0)),
  ),
  onTap: () => _gotoDetailsPage(context),
  title: const Text(
    'Tap on the icon to view hero animation transition.',
  ),
),
//...
void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: const Center(
          child: Hero(
            tag: 'hero-rectangle',
            child: BoxWidget(size: Size(200.0, 200.0)),
          ),
        ),
      ),
    ));
  }
    ''';
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Sample')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            const SizedBox(height: 20.0),
            ListTile(
              leading: const Hero(
                tag: 'hero-rectangle',
                child: BoxWidget(size: Size(50.0, 50.0)),
              ),
              onTap: () => _gotoDetailsPage(context),
              title: const Text(
                'Tap on the icon to view hero animation transition.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: const Center(
          child: Hero(
            tag: 'hero-rectangle',
            child: BoxWidget(size: Size(200.0, 200.0)),
          ),
        ),
      ),
    ));
  }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue,
    );
  }
}
