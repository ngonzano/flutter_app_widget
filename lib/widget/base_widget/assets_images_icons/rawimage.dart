import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'dart:isolate';

class PixelManipulationExample extends StatefulWidget {
  const PixelManipulationExample({super.key});

  @override
  State<PixelManipulationExample> createState() =>
      _PixelManipulationExampleState();
}

enum FilterType { none, grayscale, sepia, invert }

class _PixelManipulationExampleState extends State<PixelManipulationExample> {
  ui.Image? _originalImage;
  ui.Image? _processedImage;
  FilterType _currentFilter = FilterType.none;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  // Cargar la imagen desde los activos
  Future<void> _loadImage() async {
    final ByteData data = await rootBundle.load(
        'assets/images/image.png'); // Asegúrate de que esta ruta es correcta
    final ui.Codec codec =
        await ui.instantiateImageCodec(data.buffer.asUint8List());
    final ui.FrameInfo fi = await codec.getNextFrame();
    setState(() {
      _originalImage = fi.image;
      _processedImage = fi.image;
    });
  }

  // Aplicar el filtro seleccionado
  Future<void> _applyFilter(FilterType filter) async {
    if (_originalImage == null) return;

    setState(() {
      _isProcessing = true;
    });

    // Extraer los datos de píxeles de la imagen original
    final ByteData? byteData = await _originalImage!.toByteData(
      format: ui.ImageByteFormat.rawRgba,
    );

    if (byteData == null) {
      setState(() {
        _isProcessing = false;
      });
      return;
    }

    Uint8List pixels = byteData.buffer.asUint8List();

    // Crear un ReceivePort para recibir los datos procesados
    final ReceivePort receivePort = ReceivePort();

    // Enviar los datos al isolate
    await Isolate.spawn<_IsolateData>(
      _filterIsolate,
      _IsolateData(
        sendPort: receivePort.sendPort,
        pixels: pixels,
        filter: filter,
      ),
    );

    // Esperar por los datos procesados
    final Uint8List? processedPixels = await receivePort.first as Uint8List?;

    if (processedPixels == null || processedPixels.isEmpty) {
      setState(() {
        _isProcessing = false;
      });
      return;
    }

    // Crear una nueva ui.Image desde los bytes procesados
    final ui.ImmutableBuffer buffer =
        await ui.ImmutableBuffer.fromUint8List(processedPixels);
    final ui.ImageDescriptor descriptor = ui.ImageDescriptor.raw(
      buffer,
      width: _originalImage!.width,
      height: _originalImage!.height,
      pixelFormat: ui.PixelFormat.rgba8888,
    );
    final ui.Codec codecProcessed = await descriptor.instantiateCodec();
    final ui.FrameInfo fiProcessed = await codecProcessed.getNextFrame();
    final ui.Image processedImage = fiProcessed.image;

    setState(() {
      _processedImage = processedImage;
      _currentFilter = filter;
      _isProcessing = false;
    });
  }

  // Función del isolate para aplicar el filtro
  static void _filterIsolate(_IsolateData data) {
    Uint8List pixels = data.pixels;

    for (int i = 0; i < pixels.length; i += 4) {
      int r = pixels[i];
      int g = pixels[i + 1];
      int b = pixels[i + 2];
      // int a = pixels[i + 3]; // Canal alfa, no se modifica

      switch (data.filter) {
        case FilterType.grayscale:
          int gray = ((0.3 * r) + (0.59 * g) + (0.11 * b)).round();
          pixels[i] = gray;
          pixels[i + 1] = gray;
          pixels[i + 2] = gray;
          break;
        case FilterType.sepia:
          int tr = (0.393 * r + 0.769 * g + 0.189 * b).round();
          int tg = (0.349 * r + 0.686 * g + 0.168 * b).round();
          int tb = (0.272 * r + 0.534 * g + 0.131 * b).round();
          pixels[i] = tr > 255 ? 255 : tr;
          pixels[i + 1] = tg > 255 ? 255 : tg;
          pixels[i + 2] = tb > 255 ? 255 : tb;
          break;
        case FilterType.invert:
          pixels[i] = 255 - r;
          pixels[i + 1] = 255 - g;
          pixels[i + 2] = 255 - b;
          break;
        case FilterType.none:
          // No hacer nada
          break;
      }
      // El canal alfa permanece igual
    }

    // Enviar los píxeles procesados de vuelta al hilo principal
    data.sendPort.send(pixels);
  }

  @override
  Widget build(BuildContext context) {
    const code = '''
RawImage: usado para aplicar filtros a las imagenes
uso de -Isolate-
    ''';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo Avanzado de RawImage'),
      ),
      body: _originalImage == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Mostrar el código relevante con resaltado
                  HighlightView(
                    code,
                    language: 'dart',
                    theme: friendlyTheme,
                    padding: const EdgeInsets.all(12.0),
                    textStyle: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Mostrar controles para seleccionar filtros
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: FilterType.values.map((filter) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          onPressed:
                              _isProcessing ? null : () => _applyFilter(filter),
                          child: Text(
                              filter.toString().split('.').last.toUpperCase()),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  // Mostrar indicador de procesamiento
                  if (_isProcessing) const CircularProgressIndicator(),
                  if (!_isProcessing)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Imagen original
                        Column(
                          children: [
                            const Text('Original'),
                            RawImage(
                              image: _originalImage!,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        // Imagen procesada
                        Column(
                          children: [
                            Text(_currentFilter == FilterType.none
                                ? 'Procesada (Sin filtro)'
                                : 'Procesada (${_currentFilter.toString().split('.').last})'),
                            RawImage(
                              image: _processedImage!,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
    );
  }
}

// Clase para pasar datos al isolate
class _IsolateData {
  final SendPort sendPort;
  final Uint8List pixels;
  final FilterType filter;

  _IsolateData({
    required this.sendPort,
    required this.pixels,
    required this.filter,
  });
}
