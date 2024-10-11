import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  // Clave para el formulario
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos del formulario
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Liberar los controladores al eliminar el widget
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const code = '''
final _formKey = GlobalKey<FormState>();
//...
Form(
    key: _formKey, // Asignar la clave al formulario
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
          // Campo de nombre
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nombre',
            ),
            validator: (value) {
              // Validación del campo de nombre
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su nombre';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          // Campo de correo electrónico
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Correo electrónico',
            ),
            validator: (value) {
              // Validación del campo de correo electrónico
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su correo electrónico';
              } else if (!value.contains('@')) {
                return 'Por favor ingrese un correo electrónico válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          // Campo de contraseña
          TextFormField(
            controller: _passwordController,
            obscureText: true, // Ocultar la contraseña
            decoration: const InputDecoration(
              labelText: 'Contraseña',
            ),
            validator: (value) {
              // Validación del campo de contraseña
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su contraseña';
              } else if (value.length < 6) {
                return 'La contraseña debe tener al menos 6 caracteres';
              }
              return null;
            },
          ),
          const SizedBox(height: 32.0),
          // Botón de enviar
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Validar el formulario al presionar el botón
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
  ),                )
    ''';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Ejemplo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Asignar la clave al formulario
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
                // Campo de nombre
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                  ),
                  validator: (value) {
                    // Validación del campo de nombre
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                // Campo de correo electrónico
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                  ),
                  validator: (value) {
                    // Validación del campo de correo electrónico
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su correo electrónico';
                    } else if (!value.contains('@')) {
                      return 'Por favor ingrese un correo electrónico válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                // Campo de contraseña
                TextFormField(
                  controller: _passwordController,
                  obscureText: true, // Ocultar la contraseña
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                  ),
                  validator: (value) {
                    // Validación del campo de contraseña
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su contraseña';
                    } else if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                // Botón de enviar
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Validar el formulario al presionar el botón
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
