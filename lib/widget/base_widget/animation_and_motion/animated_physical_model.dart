import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class AnimatedPhysicalModelExample extends StatefulWidget {
  const AnimatedPhysicalModelExample({super.key});

  @override
  State<AnimatedPhysicalModelExample> createState() =>
      _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState
    extends State<AnimatedPhysicalModelExample> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    const code = '''
AnimatedPhysicalModel(
  duration: const Duration(milliseconds: 500),
  curve: Curves.fastOutSlowIn,
  elevation: _selected ? 10 : 2,
  shape: BoxShape.circle,
  shadowColor: _selected ? Colors.blue : Colors.grey,
  color: Colors.white,
  borderRadius: BorderRadius.circular(100),
  child: Container(
    height: 150,
    width: 150,
    decoration: BoxDecoration(
      color: _selected ? Colors.blue : Colors.grey[300],
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Icon(
        Icons.favorite,
        color: _selected ? Colors.white : Colors.grey,
        size: 60,
      ),
    ),
  ),
)
    ''';
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: Center(
        child: SingleChildScrollView(
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
              AnimatedPhysicalModel(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                elevation: _selected ? 10 : 2,
                shape: BoxShape.circle,
                shadowColor: _selected ? Colors.blue : Colors.grey,
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: _selected ? Colors.blue : Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: _selected ? Colors.white : Colors.grey,
                      size: 60,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
