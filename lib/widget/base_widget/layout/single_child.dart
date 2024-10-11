import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class SingleChildWidget extends StatelessWidget {
  const SingleChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Offset position = const Offset(100.0, 50.0);
          Navigator.push(
              context,
              createFadePageRouteBuilder(
                  page: Scaffold(
                    appBar: AppBar(
                      title: const Text('Ejemplo de CustomSingleChildLayout'),
                    ),
                    body: Stack(
                      children: <Widget>[
                        CustomSingleChildLayout(
                          delegate: MyDelegate(
                              position: position), // Create instance here
                          child: Container(
                            width: 100.0,
                            height: 200.0,
                            color: Colors.blue,
                          ),
                        ),
                        // ... rest of your code
                      ],
                    ),
                  ),
                  name: 'SingleChildWidget'));
        },
        label: const Text('CustomSingleChildLayout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HighlightView(
              '''
child: const Align(
  alignment: Alignment.topRight,
  child: FlutterLogo(
    size: 60,
  ),
),
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            Center(
              child: Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: const Align(
                  alignment: Alignment.topRight,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
            ),
            const Divider(),
            HighlightView(
              '''
child: AspectRatio(
  aspectRatio: 5, // 0.5, // 2.0, // 16 / 9,
  child: Container(
    color: Colors.green,
  ),
),
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            Container(
              color: Colors.blue,
              alignment: Alignment.center,
              width: double.infinity,
              height: 100.0,
              child: AspectRatio(
                aspectRatio: 5, // 0.5, // 2.0, // 16 / 9,
                child: Container(
                  color: Colors.green,
                ),
              ),
            ),
            const Divider(),
            HighlightView(
              '''
child: Baseline(
  baseline: 100, // Posición vertical de la línea base
  baselineType: TextBaseline.alphabetic, // Tipo de línea base
  child: Container(
    color: Colors.blue,
    child: const Text(
      'Hola mundo',
      style: TextStyle(fontSize: 24),
    ),
  ),
),
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.yellow,
              child: Baseline(
                baseline: 100, // Posición vertical de la línea base
                baselineType: TextBaseline.alphabetic, // Tipo de línea base
                child: Container(
                  color: Colors.blue,
                  child: const Text(
                    'Hola mundo',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
            const Divider(),
            HighlightView(
              '''
ConstrainedBox(
  constraints: const BoxConstraints(
    maxWidth: 150,
    maxHeight: 50,
  ),
  child: Container(
    color: Colors.green,
    child: const Center(
      child: Text(
        'Ancho máximo: 150\nAlto máximo: 50',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
  ),
),
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 150,
                maxHeight: 50,
              ),
              child: Container(
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Ancho máximo: 150\nAlto máximo: 50',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const Divider(),
            HighlightView(
              '''
 SizedBox(
  width: double.infinity,
  height: 250,
  child: Center(
    child: Column(
      children: <Widget>[
        Container(
          color: Colors.blue,
          height: 100,
          width: double.infinity,
        ),
        Expanded(
          child: Container(
            color: Colors.amber,
            width: 100,
          ),
        ),
      ],
    ),
  ),
)
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.blue,
                      height: 100,
                      width: double.infinity,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.amber,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            HighlightView(
              '''
Container(
  decoration: BoxDecoration(
      border: Border.all(width: 2, color: Colors.green)),
  width: 300,
  height: 20,
  child: const Text(
      'This is a very long text that needs to fit within a limited space.'),

const SizedBox(
  height: 12,

// With FittedBox
Container(
  decoration: BoxDecoration(
    border: Border.all(width: 2, color: Colors.green),
  ),
  width: 300,
  height: 20,
  child: const FittedBox(
    fit: BoxFit.scaleDown,
    child: Text(
      'This is a very long text that needs to fit within a limited space.',
      style: TextStyle(fontSize: 20),
    ),
  ),
),
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.green)),
              width: 300,
              height: 20,
              child: const Text(
                  'This is a very long text that needs to fit within a limited space.'),
            ),

            const SizedBox(
              height: 12,
            ),

            // With FittedBox
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.green),
              ),
              width: 300,
              height: 20,
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'This is a very long text that needs to fit within a limited space.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const Divider(),
            HighlightView(
              '''
SizedBox(
  height: 300,
  width: double.infinity,
  child: FractionallySizedBox(
    widthFactor: 0.8,
    heightFactor: 0.8,
    alignment: FractionalOffset.center,
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Colors.red,
          Colors.green,
          Colors.blue,
        ]),
        border: Border.all(
          color: Colors.black,
          width: 10,
        ),
      ),
    ),
  ),
)
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.8,
                alignment: FractionalOffset.center,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Colors.red,
                      Colors.green,
                      Colors.blue,
                    ]),
                    border: Border.all(
                      color: Colors.black,
                      width: 10,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            HighlightView(
              '''
IntrinsicHeight(//si se quita se rompe
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        color: Colors.blue,
        width: 100,
        child: const Text('Cuadro 1'),
      ),
      Container(
        color: Colors.green,
        width: 150,
        child: const Text('Cuadro 2\ncon\nmúltiples\nlíneas'),
      ),
      Container(
        color: Colors.orange,
        width: 75,
        child: const Text('Cuadro 3'),
      ),
    ],
  ),
),
const SizedBox(height: 10),
IntrinsicWidth(
  child: Column(
    children: [
      Container(
        color: Colors.lightBlue.shade100,
        child: const Text(
            'Esta clase es útil, por ejemplo, cuando hay disponible un ancho ilimitado y desea que un elemento secundario que de otro modo intentaría expandirse infinitamente se ajuste a un ancho más razonable.'),
      ),
      Container(
        color: Colors.red.shade100,
        child: const Text('Texto corto'),
      ),
    ],
  ),
)
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.blue,
                    width: 100,
                    child: const Text('Cuadro 1'),
                  ),
                  Container(
                    color: Colors.green,
                    width: 150,
                    child: const Text('Cuadro 2\ncon\nmúltiples\nlíneas'),
                  ),
                  Container(
                    color: Colors.orange,
                    width: 75,
                    child: const Text('Cuadro 3'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            IntrinsicWidth(
              child: Column(
                children: [
                  Container(
                    color: Colors.lightBlue.shade100,
                    child: const Text(
                        'Esta clase es útil, por ejemplo, cuando hay disponible un ancho ilimitado y desea que un elemento secundario que de otro modo intentaría expandirse infinitamente se ajuste a un ancho más razonable.'),
                  ),
                  Container(
                    color: Colors.red.shade100,
                    child: const Text('Texto corto'),
                  ),
                ],
              ),
            ),
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                HighlightView(
                  '''
LimitedBox te permite establecer límites máximos de tamaño en sus widgets hijos, lo que te da más control sobre el diseño de tu aplicación, especialmente cuando el contenido del hijo podría desbordarse.

LimitedBox(
  maxHeight: 100,
  maxWidth: 200,
  child: Container(
    color: Colors.blue,
    child: const Center(
      child: Text(
        'LimitedBox\nAncho máximo: 200\nAlto máximo: 100',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
  ),
),
''',
                  language: 'dart', // Especifica que es código Dart
                  theme: atomOneDarkTheme,
                  padding: const EdgeInsets.all(12.0),
                  textStyle: const TextStyle(
                    fontFamily: 'Courier', // Fuente monoespaciada
                    fontSize: 16.0,
                  ),
                ),
                Container(
                  color: Colors.grey[300],
                  child: const Text(
                    'Sin LimitedBox',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(height: 20),
                // LimitedBox con ancho y alto máximos
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Container\nwidth: 200\nheight: 100',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // LimitedBox con ancho máximo y sin restricciones de altura
                LimitedBox(
                  maxWidth: 200,
                  maxHeight: 100,
                  child: Container(
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'LimitedBox\nAncho máximo: 200\nAlto máximo: 100',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            HighlightView(
              '''
Usos comunes:

Mostrar/ocultar elementos condicionalmente: Puedes usar Offstage para mostrar u ocultar un widget según una condición, como la respuesta de una API, la selección del usuario, etc.
Mejorar el rendimiento: Si tienes un widget complejo que no siempre es visible, usar Offstage puede mejorar el rendimiento al evitar que Flutter lo dibuje cuando no es necesario.
Animaciones: Puedes animar la propiedad offstage para crear transiciones suaves al mostrar u ocultar un widget.

Diferencias con Visibility:
Offstage elimina completamente el widget del diseño cuando offstage es true, mientras que Visibility puede mantener el espacio del widget incluso cuando está oculto (usando Visibility.gone).
Offstage es más eficiente si el widget que se oculta es complejo, ya que no se realiza ningún trabajo de renderizado.

Offstage(
  offstage: _offstage, //true o false
  child: FlutterLogo(
    key: _key,
    size: 150.0,
  ),
),
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 300,
              child: OffstageApp(),
            ),
            const Divider(),
            HighlightView(
              '''
Un widget que impone a su elemento secundario restricciones diferentes a las que recibe de su elemento primario, lo que posiblemente permita que el elemento secundario desborde al elemento primario.

Container(
  width: 100,
  height: 100,
  color: Theme.of(context).colorScheme.secondaryContainer,
  child: const OverflowBox(
    maxWidth: 200,
    maxHeight: 200,
    child: FlutterLogo(size: 200),
  ),
),
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 300,
              child: OverflowBoxApp(),
            ),
            const Divider(),
            HighlightView(
              '''
child: Container(
  color: Colors.green,
  child: SizedOverflowBox(
    size: const Size(150, 350), // Tamaño deseado
    alignment: Alignment.center,
    child: Container(
      color: Colors.red,
      width: 200, // Ancho del hijo que excede los límites
      height: 200, // Alto del hijo que excede los límites
      child: const Center(
        child: Text(
          'SizedOverflowBox',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ),
)
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            Center(
              child: Container(
                color: Colors.green,
                child: SizedOverflowBox(
                  size: const Size(150, 350), // Tamaño deseado
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.red,
                    width: 200, // Ancho del hijo que excede los límites
                    height: 200, // Alto del hijo que excede los límites
                    child: const Center(
                      child: Text(
                        'SizedOverflowBox',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            HighlightView(
              '''
ColoredBox(
  color: Colors.black,
  child: Transform(
    alignment: Alignment.topRight,
    transform: Matrix4.skewY(0.2)..rotateZ(-180 / 11.5),
    child: Container(
      padding: const EdgeInsets.all(8.0),
      color: const Color(0xFFE8581C),
      child: const Text('Apartment for rent!'),
    ),
  ),
)
//
Transform
Transform.flip
Transform.rotate
Transform.scale
Transform.translate
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            ColoredBox(
              color: Colors.amber,
              child: Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(0.2)..rotateZ(-180 / 11.5),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: const Color(0xFFE8581C),
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
            const SizedBox(height: 200)
          ],
        ),
      ),
    );
  }
}

//Pendiente de mostrar
class MyDelegate extends SingleChildLayoutDelegate {
  MyDelegate({required this.position});

  final Offset position;

  @override
  bool shouldRelayout(covariant MyDelegate oldDelegate) {
    return position != oldDelegate.position;
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return position;
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.loosen();
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return constraints.biggest;
  }
}

class CustomSingleChildLayoutExample extends StatefulWidget {
  const CustomSingleChildLayoutExample({super.key});

  @override
  State<CustomSingleChildLayoutExample> createState() =>
      _CustomSingleChildLayoutExampleState();
}

class _CustomSingleChildLayoutExampleState
    extends State<CustomSingleChildLayoutExample> {
  Offset _position = const Offset(50.0, 50.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de CustomSingleChildLayout'),
      ),
      body: Stack(
        children: <Widget>[
          CustomSingleChildLayout(
            delegate: MyDelegate(position: _position),
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.blue,
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Slider(
              value: _position.dx,
              min: 0.0,
              max: MediaQuery.of(context).size.width - 100.0,
              onChanged: (value) {
                setState(() {
                  _position = Offset(value, _position.dy);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
/////////////Offstage/////////////////

class OffstageApp extends StatelessWidget {
  const OffstageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Offstage Sample')),
        body: const Center(
          child: OffstageExample(),
        ),
      ),
    );
  }
}

class OffstageExample extends StatefulWidget {
  const OffstageExample({super.key});

  @override
  State<OffstageExample> createState() => _OffstageExampleState();
}

class _OffstageExampleState extends State<OffstageExample> {
  final GlobalKey _key = GlobalKey();
  bool _offstage = true;

  Size _getFlutterLogoSize() {
    final RenderBox renderLogo =
        _key.currentContext!.findRenderObject()! as RenderBox;
    return renderLogo.size;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Offstage(
          offstage: _offstage,
          child: FlutterLogo(
            key: _key,
            size: 150.0,
          ),
        ),
        Text('Flutter logo is offstage: $_offstage'),
        ElevatedButton(
          child: const Text('Toggle Offstage Value'),
          onPressed: () {
            setState(() {
              _offstage = !_offstage;
            });
          },
        ),
        if (_offstage)
          ElevatedButton(
              child: const Text('Get Flutter Logo size'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Flutter Logo size is ${_getFlutterLogoSize()}'),
                  ),
                );
              }),
      ],
    );
  }
}

/////////////OverflowBoxApp/////////////////

class OverflowBoxApp extends StatelessWidget {
  const OverflowBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('OverflowBox Sample')),
        body: const Center(
          child: OverflowBoxExample(),
        ),
      ),
    );
  }
}

class OverflowBoxExample extends StatelessWidget {
  const OverflowBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Cover Me'),
        Container(
          width: 100,
          height: 100,
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: const OverflowBox(
            maxWidth: 200,
            maxHeight: 200,
            child: FlutterLogo(size: 200),
          ),
        ),
      ],
    );
  }
}
