import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class KeyboardListenerExample extends StatefulWidget {
  const KeyboardListenerExample({super.key});

  @override
  State<KeyboardListenerExample> createState() =>
      _KeyboardListenerExampleState();
}

class _KeyboardListenerExampleState extends State<KeyboardListenerExample> {
  // Variable para almacenar el texto ingresado
  String _inputText = '';

  // Variable para controlar la visibilidad del mensaje
  bool _showMessage = false;

  @override
  Widget build(BuildContext context) {
    const code = '''
child: KeyboardListener(
          focusNode: FocusNode(),
          onKeyEvent: (KeyEvent event) {
            // Detectar si se presionó la tecla "Enter"
            if (event is KeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.enter) {
              setState(() {
                _showMessage =
                    !_showMessage; // Cambiar la visibilidad del mensaje
              });
            }
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Campo de texto para ingresar texto
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        _inputText = text;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Escribe algo y presiona Enter',
                    ),
                  ),
                ),
                // Mostrar el mensaje si _showMessage es verdadero
                if (_showMessage)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Texto ingresado: _inputText',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
              ],
            ),
          ),
        )
    ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de KeyboardListener'),
      ),
      body: Center(
        child: KeyboardListener(
          focusNode: FocusNode(),
          onKeyEvent: (KeyEvent event) {
            // Detectar si se presionó la tecla "Enter"
            if (event is KeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.enter) {
              setState(() {
                _showMessage =
                    !_showMessage; // Cambiar la visibilidad del mensaje
              });
            }
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                // Campo de texto para ingresar texto
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        _inputText = text;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Escribe algo y presiona Enter',
                    ),
                  ),
                ),
                // Mostrar el mensaje si _showMessage es verdadero
                if (_showMessage)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Texto ingresado: $_inputText',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
