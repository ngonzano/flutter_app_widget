import 'package:flutter/material.dart';

class MergeSemanticsExample extends StatefulWidget {
  const MergeSemanticsExample({super.key});

  @override
  State<MergeSemanticsExample> createState() => _MergeSemanticsExampleState();
}

class _MergeSemanticsExampleState extends State<MergeSemanticsExample> {
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MergeSemantics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MergeSemantics(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.volume_mute),
                  Slider(
                    value: _sliderValue,
                    onChanged: (newValue) {
                      setState(() {
                        _sliderValue = newValue;
                      });
                    },
                  ),
                  const Icon(Icons.volume_up),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Semantics(
              enabled: true,
              label: 'Volumen actual: ${(_sliderValue * 100).toInt()}%',
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Center(
                  child:
                      Text('Volumen actual: ${(_sliderValue * 100).toInt()}%'),
                ),
              ), // Widget invisible
            ),
          ],
        ),
      ),
    );
  }
}


/**
 * En resumen:

Utiliza MergeSemantics cuando necesites presentar un grupo de 
widgets como una sola unidad semántica para mejorar la 
accesibilidad y la experiencia del usuario, especialmente para
aquellos que utilizan lectores de pantalla. Evita usarlo cuando
los widgets tengan funciones independientes o cuando la jerarquía 
semántica ya sea clara.
 */