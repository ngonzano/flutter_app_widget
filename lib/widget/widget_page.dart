import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/base_widget/base_widget.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

import 'widget_screen.dart';

class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AccessibilityWidget(),
            AnimationAndMotionWidget(),
            AssetsImagesIconsWidget(),
            FutureBuilderWidget(),
            InputWidget(),
            InteractionModelWidget(),
            LayoutWidget(),
            PaintingEffectWidget(),
          ],
        ),
      ),
    );
  }
}

class PaintingEffectWidget extends StatelessWidget {
  const PaintingEffectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Painting Effect widgets'),
      subtitle: const Text(
          'Estos widgets aplican efectos visuales a los niños sin cambiar su diseño, tamaño o posición.'),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () {
        Navigator.push(
          context,
          createFadePageRouteBuilder(
            page: const WidgetScreen(
              tabBar: TabBar(
                isScrollable: true,
                // automaticIndicatorColorAdjustment: false,
                dragStartBehavior: DragStartBehavior.start,
                tabs: [
                  Tab(text: 'RawScrollbar'),
                  Tab(text: 'Reorderable'),
                  Tab(text: 'RefreshIndicator'),
                  Tab(text: 'PageView'),
                  Tab(text: 'NotificationListener'),
                  Tab(text: 'BackdropFilter'),
                  Tab(text: 'ClipOval'),
                  Tab(text: 'ClipPath'),
                  Tab(text: 'ClipRRect'),
                  Tab(text: 'CustomPaint'),
                  Tab(text: 'DecoratedBox'),
                  Tab(text: 'FractionalTranslation'),
                  Tab(text: 'RotatedBox'),
                ],
              ),
              title: 'Painting and effect',
              tabBarView: TabBarView(
                children: [
                  RawScrollbarExampleApp(),
                  ReorderableExample(),
                  RefreshIndicatorExample(),
                  PageViewExample(),
                  NotificationListenerExample(),
                  BackdropFilterExample(),
                  ClipOvalExample(),
                  ClipPathExample(),
                  ClipRRectExample(),
                  CustomPaintExample(),
                  DecoratedBoxExample(),
                  FractionalTranslationExample(),
                  RotatedBoxExample(),
                ],
              ),
              length: 13,
            ),
            name: 'Painting and Effect',
          ),
        );
      },
    );
  }
}

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Layout widgets'),
      subtitle: const Text(
          'Organice otros widgets en columnas, filas, cuadrículas y muchos otros diseños.'),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () {
        Navigator.push(
          context,
          createFadePageRouteBuilder(
            page: const WidgetScreen(
              tabBar: TabBar(
                isScrollable: true,
                // automaticIndicatorColorAdjustment: false,
                dragStartBehavior: DragStartBehavior.start,
                tabs: [
                  Tab(text: 'single-child'),
                  Tab(text: 'multi-child'),
                  Tab(text: 'Sliver'),
                ],
              ),
              title: 'Input',
              tabBarView: TabBarView(
                children: [
                  SingleChildWidget(),
                  MultiChildWidget(),
                  SliverScreen(),
                ],
              ),
              length: 3,
            ),
            name: 'LayoutWidget',
          ),
        );
      },
    );
  }
}

class InteractionModelWidget extends StatelessWidget {
  const InteractionModelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Interaction model widgets'),
      subtitle: const Text(
          'Responder a eventos táctiles y dirigir a los usuarios a diferentes vistas.'),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () {
        Navigator.push(
          context,
          createFadePageRouteBuilder(
            page: const WidgetScreen(
              tabBar: TabBar(
                isScrollable: true,
                // automaticIndicatorColorAdjustment: false,
                dragStartBehavior: DragStartBehavior.start,
                tabs: [
                  Tab(text: 'AbsorbPointer'),
                  Tab(text: 'Dismissible'),
                  Tab(text: 'DragTarget'),
                  Tab(text: 'DraggableScrollableSheet'),
                  Tab(text: 'IgnorePointer'),
                  Tab(text: 'InteractiveViewer'),
                  Tab(text: 'LongPressDraggable'),
                  Tab(text: 'FormField'),
                ],
              ),
              title: 'Input',
              tabBarView: TabBarView(
                children: [
                  AbsorbPointerApp(),
                  DismissibleExampleApp(),
                  DragTargetExample(),
                  DraggableScrollableSheetExampleApp(),
                  IgnorePointerApp(),
                  InteractiveViewerExampleApp(),
                  LongPressDraggableExample(),
                  KeyboardListenerExample(),
                ],
              ),
              length: 8,
            ),
            name: 'InteractionModelWidget',
          ),
        );
      },
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Input Widget'),
      subtitle: const Text(
          'Acepte la entrada del usuario además de los widgets de entrada en los componentes Material y Cupertino.'),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () {
        Navigator.push(
          context,
          createFadePageRouteBuilder(
            page: const WidgetScreen(
              tabBar: TabBar(
                isScrollable: true,
                // automaticIndicatorColorAdjustment: false,
                dragStartBehavior: DragStartBehavior.start,
                tabs: [
                  Tab(text: 'AutoComplete'),
                  Tab(text: 'Form'),
                  Tab(text: 'FormField'),
                  Tab(text: 'KeyboardListener'),
                ],
              ),
              title: 'Input',
              tabBarView: TabBarView(
                children: [
                  AutoCompleteExample(),
                  FormExample(),
                  FormFieldExample(),
                  KeyboardListenerExample(),
                ],
              ),
              length: 4,
            ),
            name: 'InputWidget',
          ),
        );
      },
    );
  }
}

class FutureBuilderWidget extends StatelessWidget {
  const FutureBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('FutureBuilder'),
      subtitle: const Text(
          'Un widget que se construye a sí mismo basándose en la última instantánea de la interacción con un Futuro'),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () {
        Navigator.push(
          context,
          createFadePageRouteBuilder(
            page: const WidgetScreen(
              tabBar: TabBar(
                isScrollable: true,
                // automaticIndicatorColorAdjustment: false,
                dragStartBehavior: DragStartBehavior.start,
                tabs: [
                  Tab(text: 'FutureBuilder'),
                  Tab(text: 'StreamBuilder'),
                ],
              ),
              title: 'Accessibility',
              tabBarView: TabBarView(
                children: [
                  FutureBuilderExampleApp(),
                  StreamBuilderExampleApp(),
                ],
              ),
              length: 2,
            ),
            name: 'FutureBuilderWidget',
          ),
        );
      },
    );
  }
}

class AssetsImagesIconsWidget extends StatelessWidget {
  const AssetsImagesIconsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Assets, images, and icon widgets'),
      subtitle:
          const Text('Administrar activos, mostrar imágenes y mostrar íconos.'),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () {
        Navigator.push(
          context,
          createFadePageRouteBuilder(
            page: const WidgetScreen(
              tabBar: TabBar(
                isScrollable: true,
                // automaticIndicatorColorAdjustment: false,
                dragStartBehavior: DragStartBehavior.start,
                tabs: [
                  Tab(text: 'RawImage'),
                  Tab(text: 'Image.asset'),
                  Tab(text: 'Icos'),
                  Tab(text: 'NetworkImage'),
                ],
              ),
              title: 'Accessibility',
              tabBarView: TabBarView(
                children: [
                  PixelManipulationExample(),
                  MyImageWidget(),
                  IconsScreen(),
                  ImageNetworkScreen(),
                ],
              ),
              length: 4,
            ),
            name: 'AssetsImagesIconsWidget',
          ),
        );
      },
    );
  }
}

class AnimationAndMotionWidget extends StatelessWidget {
  const AnimationAndMotionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Animation and motion'),
      subtitle: const Text('Lleva animaciones a tu aplicación.'),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () {
        Navigator.push(
          context,
          createFadePageRouteBuilder(
            page: const WidgetScreen(
              tabBar: TabBar(
                isScrollable: true,
                // automaticIndicatorColorAdjustment: false,
                dragStartBehavior: DragStartBehavior.start,
                tabs: [
                  Tab(text: 'SlideTransition'),
                  Tab(text: 'SizeTransition'),
                  Tab(text: 'ScaleTransitionExampleApp'),
                  Tab(text: 'RotationTransition'),
                  Tab(text: 'PositionedTransition'),
                  Tab(text: 'Hero'),
                  Tab(text: 'FadeTransition'),
                  Tab(text: 'DecoratedBoxTransition'),
                  Tab(text: 'Animacion implicita'),
                  Tab(text: 'AnimatedWidget'),
                  Tab(text: 'AnimatedSize'),
                  Tab(text: 'AnimatedPositioned'),
                  Tab(text: 'AnimatedPhysicalModel'),
                  Tab(text: 'AnimatedOpacity'),
                  Tab(text: 'AnimatedAlign'),
                  Tab(text: 'AnimatedBuilder'),
                  Tab(text: 'AnimatedContainer'),
                  Tab(text: 'AnimatedCrossFade'),
                  Tab(text: 'AnimatedDefaultTextStyle'),
                  Tab(text: 'AnimatedList'),
                  Tab(text: 'AnimatedModalBarrier'),
                ],
              ),
              title: 'Animation and motion',
              tabBarView: TabBarView(
                children: [
                  SlideTransitionExampleApp(),
                  SizeTransitionExampleApp(),
                  ScaleTransitionExampleApp(),
                  RotationTransitionExampleApp(),
                  PositionedTransitionExampleApp(),
                  HeroApp(),
                  FadeTransitionExampleApp(),
                  DecoratedBoxTransitionExampleApp(),
                  ImplicitlyAnimatedWidgetExample(),
                  AnimatedWidgetExampleApp(),
                  AnimatedSizeExampleApp(),
                  AnimatedPositionedExampleApp(),
                  AnimatedPhysicalModelExample(),
                  AnimatedOpacityWidgetExample(),
                  AnimatedAlignExampleApp(),
                  AnimatedBuilderExampleApp(),
                  AnimatedContainerExampleApp(),
                  AnimatedCrossFadeExample(),
                  AnimatedDefaultTextStyleExample(),
                  AnimatedListSample(),
                  AnimatedModalBarrierExample(),
                ],
              ),
              length: 21,
            ),
            name: 'AnimationAndMotionWidget',
          ),
        );
      },
    );
  }
}

class AccessibilityWidget extends StatelessWidget {
  const AccessibilityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Accessibility'),
      subtitle: const Text('Haga que su aplicación sea accesible.'),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () {
        Navigator.push(
          context,
          createFadePageRouteBuilder(
            page: const WidgetScreen(
              tabBar: TabBar(
                tabs: [
                  Tab(text: 'ExcludeSemantics'),
                  Tab(text: 'MergeSemantics'),
                  Tab(text: 'Semantics'),
                ],
              ),
              title: 'Accessibility',
              tabBarView: TabBarView(
                children: [
                  ExcludeSemanticsExample(),
                  MergeSemanticsExample(),
                  SemanticsExample(),
                ],
              ),
              length: 3,
            ),
            name: 'AccessibilityWidget',
          ),
        );
      },
    );
  }
}

////////////////////////////////////////////////////////////////
///NO SE TOCA////////////////////////////////
////////////////////////////////////////////////////////////////
// Function to create a reusable PageRouteBuilder with FadeTransition
PageRouteBuilder createFadePageRouteBuilder(
    {required Widget page, required String name}) {
  return PageRouteBuilder<void>(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
      key: ValueKey(name),
      opacity: animation,
      child: child,
    ),
  );
}

// Crea un tema personalizado basado en "atom-one-dark"
Map<String, TextStyle> friendlyTheme = atomOneDarkTheme.map((key, value) {
  // Ajusta el tamaño de fuente base
  if (key == 'root') {
    return MapEntry(
      key,
      value.copyWith(fontSize: 14),
    );
  }
  // Ajusta colores y estilos para algunos elementos clave
  switch (key) {
    case 'keyword':
      return MapEntry(key, value.copyWith(color: Colors.blue));
    case 'string':
      return MapEntry(key, value.copyWith(color: Colors.green));
    case 'comment':
      return MapEntry(key, value.copyWith(color: Colors.grey));
    default:
      return MapEntry(key, value);
  }
});
