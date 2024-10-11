import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class AutoCompleteExample extends StatefulWidget {
  const AutoCompleteExample({super.key});

  @override
  State<AutoCompleteExample> createState() => _AutoCompleteExampleState();
}

class _AutoCompleteExampleState extends State<AutoCompleteExample> {
  // Lista de opciones para el AutoComplete
  final List<String> _options = [
    'Apple',
    'Banana',
    'Cherry',
    'Grape',
    'Orange',
    'Strawberry',
    'Watermelon',
  ];

  // Variable para almacenar la opción seleccionada
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    const code = '''
final List<String> _options = [
  'Apple',
  'Banana',
  'Cherry',
  'Grape',
  'Orange',
  'Strawberry',
  'Watermelon',
];
//...
Autocomplete<String>(
  optionsBuilder: (TextEditingValue textEditingValue) {
    // Filtrar las opciones según el texto ingresado
    if (textEditingValue.text == '') {
      return const Iterable<String>.empty();
    }
    return _options.where((String option) {
      return option.toLowerCase().contains(
            textEditingValue.text.toLowerCase(),
          );
    });
  },
  // Mostrar las opciones en un menú desplegable
  fieldViewBuilder: (
    BuildContext context,
    TextEditingController fieldTextEditingController,
    FocusNode fieldFocusNode,
    VoidCallback onFieldSubmitted,
  ) {
    return TextField(
      controller: fieldTextEditingController,
      focusNode: fieldFocusNode,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter a fruit',
      ),
      onSubmitted: (String value) {
        onFieldSubmitted();
      },
    );
  },
  onSelected: (String selectedOption) {
    // Actualizar la opción seleccionada
    setState(() {
      _selectedOption = selectedOption;
    });
  },
)
    ''';

    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoComplete Example'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              // AutoComplete TextField
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    // Filtrar las opciones según el texto ingresado
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return _options.where((String option) {
                      return option.toLowerCase().contains(
                            textEditingValue.text.toLowerCase(),
                          );
                    });
                  },
                  // Mostrar las opciones en un menú desplegable
                  fieldViewBuilder: (
                    BuildContext context,
                    TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode,
                    VoidCallback onFieldSubmitted,
                  ) {
                    return TextField(
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a fruit',
                      ),
                      onSubmitted: (String value) {
                        onFieldSubmitted();
                      },
                    );
                  },
                  onSelected: (String selectedOption) {
                    // Actualizar la opción seleccionada
                    setState(() {
                      _selectedOption = selectedOption;
                    });
                  },
                ),
              ),
              // Mostrar la opción seleccionada
              if (_selectedOption != null)
                Text(
                  'Selected option: $_selectedOption',
                  style: const TextStyle(fontSize: 20),
                ),
              const SizedBox(height: 200)
            ],
          ),
        ),
      ),
    );
  }
}
