import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class PositionedTransitionExampleApp extends StatelessWidget {
  const PositionedTransitionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PositionedTransitionExample(),
    );
  }
}

class PositionedTransitionExample extends StatefulWidget {
  const PositionedTransitionExample({super.key});

  @override
  State<PositionedTransitionExample> createState() =>
      _PositionedTransitionExampleState();
}

class _PositionedTransitionExampleState
    extends State<PositionedTransitionExample> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

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
//...
const double smallLogo = 100;
const double bigLogo = 200;
//...
final Size biggest = constraints.biggest;
//...
PositionedTransition(
  rect: RelativeRectTween(
    begin: RelativeRect.fromSize(
      const Rect.fromLTWH(0, 0, smallLogo, smallLogo),
      biggest,
    ),
    end: RelativeRect.fromSize(
      Rect.fromLTWH(biggest.width - bigLogo,
          biggest.height - bigLogo, bigLogo, bigLogo),
      biggest,
    ),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticInOut,
  )),
  child: const Padding(
    padding: EdgeInsets.all(8),
    child: FlutterLogo(),
  ),
),
    ''';
    const double smallLogo = 100;
    const double bigLogo = 200;

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
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final Size biggest = constraints.biggest;
                return Stack(
                  children: <Widget>[
                    PositionedTransition(
                      rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                          const Rect.fromLTWH(0, 0, smallLogo, smallLogo),
                          biggest,
                        ),
                        end: RelativeRect.fromSize(
                          Rect.fromLTWH(biggest.width - bigLogo,
                              biggest.height - bigLogo, bigLogo, bigLogo),
                          biggest,
                        ),
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: Curves.elasticInOut,
                      )),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: FlutterLogo(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
