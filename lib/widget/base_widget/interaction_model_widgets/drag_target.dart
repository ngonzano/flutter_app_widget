import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class DragTargetExample extends StatefulWidget {
  const DragTargetExample({super.key});

  @override
  State<DragTargetExample> createState() => _DragTargetExampleState();
}

class _DragTargetExampleState extends State<DragTargetExample> {
  Color _targetColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    const code = '''
children: <Widget>[
  Draggable<Color>(
    data: Colors.blue,
    feedback: Container(
      width: 100.0,
      height: 100.0,
      color: Colors.blue.withOpacity(0.5),
    ),
    childWhenDragging: Container(
      width: 100.0,
      height: 100.0,
      color: Colors.grey,
    ),
    child: Container(
      width: 100.0,
      height: 100.0,
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Arrastrame',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ),
  const SizedBox(height: 100),
  DragTarget<Color>(
    builder: (
      BuildContext context,
      List<dynamic> accepted,
      List<dynamic> rejected,
    ) {
      return Container(
        width: 200.0,
        height: 200.0,
        color: _targetColor,
        child: Center(
          child: Text(
            'Arrastra aquí',
            style: TextStyle(
              color: _targetColor == Colors.grey
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
      );
    },
    onWillAcceptWithDetails: (data) {
      // Puedes validar si aceptas el elemento arrastrado
      return true;
    },
    onAcceptWithDetails: (details) {
      setState(() {
        _targetColor = details.data;
      });
    },
  ),
],
    ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de DragTarget'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              HighlightView(
                code,
                language: 'dart', // Especifica que es código Dart
                theme: atomOneDarkTheme,
                padding: const EdgeInsets.all(12.0),
                textStyle: const TextStyle(
                  fontFamily: 'Courier', // Fuente monoespaciada
                  fontSize: 16.0,
                ),
              ),
              Draggable<Color>(
                data: Colors.blue,
                feedback: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.blue.withOpacity(0.5),
                ),
                childWhenDragging: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.grey,
                ),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Arrastrame',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              DragTarget<Color>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    width: 200.0,
                    height: 200.0,
                    color: _targetColor,
                    child: Center(
                      child: Text(
                        'Arrastra aquí',
                        style: TextStyle(
                          color: _targetColor == Colors.grey
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                onWillAcceptWithDetails: (data) {
                  // Puedes validar si aceptas el elemento arrastrado
                  return true;
                },
                onAcceptWithDetails: (details) {
                  setState(() {
                    _targetColor = details.data;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
