import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class AnimatedModalBarrierExample extends StatefulWidget {
  const AnimatedModalBarrierExample({super.key});

  @override
  AnimatedModalBarrierExampleState createState() =>
      AnimatedModalBarrierExampleState();
}

class AnimatedModalBarrierExampleState
    extends State<AnimatedModalBarrierExample>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Inicializamos el AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Duración de la animación
      vsync: this,
    );

    // Creamos la animación de color que cambia de transparente a un color semitransparente
    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.black54,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Liberamos los recursos del controlador de animación
    super.dispose();
  }

  // Función para simular una tarea que activa el modal de carga
  Future<void> _simulateLoading() async {
    setState(() {
      _isLoading = true;
    });

    _controller.forward(); // Inicia la animación

    // Simulamos un retraso de 3 segundos (por ejemplo, una llamada a una API)
    await Future.delayed(const Duration(seconds: 3));

    _controller.reverse(); // Revertimos la animación
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const code = '''
    class AnimatedModalBarrierExampleState
    extends State<AnimatedModalBarrierExample>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  // ...

    AnimatedModalBarrier(
      color: _colorAnimation,
      dismissible: false, // No permitir que se cierre tocando
    ),

    ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedModalBarrier Example'),
      ),
      body: Stack(
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
          Center(
            child: ElevatedButton(
              onPressed: _simulateLoading,
              child: const Text('Simular carga'),
            ),
          ),
          // Solo mostramos la barrera cuando está en modo de carga
          if (_isLoading)
            AnimatedModalBarrier(
              color: _colorAnimation,
              dismissible: false, // No permitir que se cierre tocando
            ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
