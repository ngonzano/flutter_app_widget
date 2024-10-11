import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class DecoratedBoxTransitionExampleApp extends StatelessWidget {
  const DecoratedBoxTransitionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
DecoratedBoxTransition(
  decoration: decorationTween.animate(_controller),
  child: Container(
    width: 200,
    height: 200,
    padding: const EdgeInsets.all(10),
    child: const FlutterLogo(),
  ),
)
//...
final DecorationTween decorationTween = DecorationTween(
   begin: BoxDecoration(
     color: const Color(0xFFFFFFFF),
     border: Border.all(style: BorderStyle.none),
     borderRadius: BorderRadius.circular(60.0),
     boxShadow: const <BoxShadow>[
       BoxShadow(
         color: Color(0x66666666),
         blurRadius: 10.0,
         spreadRadius: 3.0,
         offset: Offset(0, 6.0),
       ),
     ],
   ),
   end: BoxDecoration(
     color: const Color(0xFFFFFFFF),
     border: Border.all(
       style: BorderStyle.none,
     ),
     borderRadius: BorderRadius.zero,
     // No shadow.
   ),
 );

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);
    ''';
    return MaterialApp(
      home: SingleChildScrollView(
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
            const DecoratedBoxTransitionExample(),
          ],
        ),
      ),
    );
  }
}

class DecoratedBoxTransitionExample extends StatefulWidget {
  const DecoratedBoxTransitionExample({super.key});

  @override
  State<DecoratedBoxTransitionExample> createState() =>
      _DecoratedBoxTransitionExampleState();
}

class _DecoratedBoxTransitionExampleState
    extends State<DecoratedBoxTransitionExample> with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(60.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66666666),
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(0, 6.0),
        ),
      ],
    ),
    end: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.zero,
      // No shadow.
    ),
  );

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: DecoratedBoxTransition(
          decoration: decorationTween.animate(_controller),
          child: Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(10),
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
