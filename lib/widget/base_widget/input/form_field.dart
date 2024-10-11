import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class FormFieldExample extends StatefulWidget {
  const FormFieldExample({super.key});

  @override
  State<FormFieldExample> createState() => _FormFieldExampleState();
}

class _FormFieldExampleState extends State<FormFieldExample> {
  // Clave para el formulario
  final _formKey = GlobalKey<FormState>();

  // Valor inicial para el campo de selección
  String? _selectedColor;

  // Lista de opciones para el campo de selección
  final List<String> _colors = ['Rojo', 'Verde', 'Azul'];

  @override
  Widget build(BuildContext context) {
    const code = '''
FormField<String>(
  builder: (FormFieldState<String> state) {
    return InputDecorator(
      decoration: const InputDecoration(
        labelText: 'Color favorito',
        border: OutlineInputBorder(),
      ),
      isEmpty: _selectedColor == null,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedColor,
          isDense: true,
          onChanged: (String? newValue) {
            setState(() {
              _selectedColor = newValue;
              state.didChange(
                  newValue); // Notificar al FormField sobre el cambio
            });
          },
          items: _colors.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  },
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Por favor seleccione un color';
    }
    return null;
  },
),
    ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de FormField'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                // Campo de selección usando FormField
                FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Color favorito',
                        border: OutlineInputBorder(),
                      ),
                      isEmpty: _selectedColor == null,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedColor,
                          isDense: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedColor = newValue;
                              state.didChange(
                                  newValue); // Notificar al FormField sobre el cambio
                            });
                          },
                          items: _colors.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor seleccione un color';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                // Botón de enviar
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Acciones a realizar si el formulario es válido
                        // ...
                        // Por ejemplo, mostrar un mensaje de éxito
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Formulario enviado')),
                        );
                      }
                    },
                    child: const Text('Enviar'),
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
