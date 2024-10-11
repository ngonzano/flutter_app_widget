import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class SemanticsExample extends StatelessWidget {
  const SemanticsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semantics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ejemplo 1: Imagen con etiqueta semántica
            Semantics(
              label: 'Una hermosa puesta de sol sobre el océano',
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHHosEL4A2uC8ncP6RnDDGMULMgy0cXnnEHA&s'),
            ),

            const SizedBox(height: 30),

            // Ejemplo 2: Botón con descripción y función personalizada
            Semantics.fromProperties(
              properties: const SemanticsProperties(
                label: 'Reproducir audio',
                increasedValue: 'Reproduce el archivo de audio seleccionado',
                button: true,
              ),
              child: IconButton(
                onPressed: () {
                  // Lógica para reproducir audio
                },
                icon: const Icon(Icons.play_circle_filled),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/**
 * 
En pocas palabras, la noción de Semántica es:
totalmente opcional (es decir, podrías vivir sin preocuparte por ello, 
pero no es recomendable), Diseñado para usarse junto con Android TalkBack o iOS VoiceOver 
(por ejemplo, principalmente por personas con discapacidad visual )
destinado a ser utilizado por un lector de pantalla que describirá la 
aplicación sin tener que mirar la pantalla.
 */