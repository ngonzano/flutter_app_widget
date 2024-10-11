import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class SlideTransitionExampleApp extends StatelessWidget {
  const SlideTransitionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('SlideTransition Sample')),
        body: const Center(
          child: SlideTransitionExample(),
        ),
      ),
    );
  }
}

class SlideTransitionExample extends StatefulWidget {
  const SlideTransitionExample({super.key});

  @override
  State<SlideTransitionExample> createState() => _SlideTransitionExampleState();
}

class _SlideTransitionExampleState extends State<SlideTransitionExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const code = '''
late final AnimationController _controller = AnimationController(
  duration: const Duration(seconds: 2),
  vsync: this,
)..repeat(reverse: true);
late final Animation<Offset> _offsetAnimation = Tween<Offset>(
  begin: Offset.zero,
  end: const Offset(1.5, 0.0),
).animate(CurvedAnimation(
  parent: _controller,
  curve: Curves.elasticIn,
));
//...
SlideTransition(
  position: _offsetAnimation,
  child: const Padding(
    padding: EdgeInsets.all(8.0),
    child: FlutterLogo(size: 150.0),
  ),
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
          SlideTransition(
            position: _offsetAnimation,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FlutterLogo(size: 150.0),
            ),
          ),
        ],
      ),
    );
  }
}
