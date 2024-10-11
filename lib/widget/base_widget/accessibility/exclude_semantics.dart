import 'package:flutter/material.dart';

class ExcludeSemanticsExample extends StatefulWidget {
  const ExcludeSemanticsExample({super.key});

  @override
  State<ExcludeSemanticsExample> createState() =>
      _ExcludeSemanticsExampleState();
}

class _ExcludeSemanticsExampleState extends State<ExcludeSemanticsExample> {
  bool _showSecret = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExcludeSemantics'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This text is always read by screen readers.',
            ),
            const SizedBox(height: 20),
            ExcludeSemantics(
              excluding: !_showSecret,
              child: Text(
                _showSecret ? 'This is a secret message!' : '🤫',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showSecret = !_showSecret;
                });
              },
              child: const Text('Reveal Secret'),
            ),
          ],
        ),
      ),
    );
  }
}


/**
 * En resumen:

Este ejemplo demuestra cómo usar ExcludeSemantics para controlar dinámicamente
qué elementos de la interfaz de usuario son accesibles para los lectores de 
pantalla, lo que permite crear experiencias más inclusivas para los usuarios con
discapacidades visuales.


 */