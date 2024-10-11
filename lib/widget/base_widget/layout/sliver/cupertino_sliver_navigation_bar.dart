import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/main.dart';
import 'package:flutter_app_widgets/widget/widget_page.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

/// Flutter code sample for [CupertinoSliverNavigationBar].
class CupertinoSliverNavigationBarScreen extends StatelessWidget {
  const CupertinoSliverNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: SliverNavBarExample(),
    );
  }
}

class SliverNavBarExample extends StatelessWidget {
  const SliverNavBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            heroTag: const ValueKey('SliverNavBarExample'),
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    createFadePageRouteBuilder(
                        page: const MyApp(),
                        name: 'CupertinoSliverNavigationBar'),
                  );
                },
                icon: const Icon(CupertinoIcons.arrow_left_circle)),
            largeTitle: const Text('Contacts'),
            trailing: const Icon(CupertinoIcons.add_circled),
          ),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text('Drag me up', textAlign: TextAlign.center),
                CupertinoButton.filled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute<Widget>(
                        builder: (BuildContext context) {
                          return const NextPage();
                        },
                      ),
                    );
                  },
                  child: const Text('Go to Next Page'),
                ),
                CupertinoButton.filled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute<Widget>(
                        builder: (BuildContext context) {
                          return CupertinoPageScaffold(
                            child: CustomScrollView(
                              slivers: <Widget>[
                                const CupertinoSliverNavigationBar(
                                  heroTag: ValueKey(
                                      'codigo_CupertinoSliverNavigationBar'),
                                  backgroundColor: CupertinoColors.systemYellow,
                                  border: Border(
                                    bottom: BorderSide(
                                        color: CupertinoColors.black),
                                  ),
                                  middle: Text('Widget Cupertino'),
                                  largeTitle: Text('Codigo'),
                                ),
                                SliverFillRemaining(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        HighlightView(
                                          '''
/// Flutter code sample for [CupertinoSliverNavigationBar].
class CupertinoSliverNavigationBarScreen extends StatelessWidget {
  const CupertinoSliverNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: SliverNavBarExample(),
    );
  }
}

class SliverNavBarExample extends StatelessWidget {
  const SliverNavBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    createFadePageRouteBuilder(page: const MyApp()),
                  );
                },
                icon: const Icon(CupertinoIcons.arrow_left_circle)),
            largeTitle: const Text('Contacts'),
            trailing: const Icon(CupertinoIcons.add_circled),
          ),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text('Drag me up', textAlign: TextAlign.center),
                CupertinoButton.filled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute<Widget>(
                        builder: (BuildContext context) {
                          return const NextPage();
                        },
                      ),
                    );
                  },
                  child: const Text('Go to Next Page'),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = CupertinoTheme.brightnessOf(context);
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            backgroundColor: CupertinoColors.systemYellow,
            border: Border(
              bottom: BorderSide(
                color: brightness == Brightness.light
                    ? CupertinoColors.black
                    : CupertinoColors.white,
              ),
            ),
            middle: const Text('Contacts Group'),
            largeTitle: const Text('Family'),
          ),
          const SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Arrástrame hacia arriba', textAlign: TextAlign.center),
                Text('Toque el botón principal para navegar hacia atrás.',
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
                                  
                                  ''',
                                          language:
                                              'dart', // Especifica que es código Dart
                                          theme: atomOneDarkTheme,
                                          padding: const EdgeInsets.all(2.0),
                                          textStyle: const TextStyle(
                                            fontFamily:
                                                'Courier', // Fuente monoespaciada
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: const Text('Ver codigo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = CupertinoTheme.brightnessOf(context);
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            heroTag: const ValueKey('NextPage'),
            backgroundColor: CupertinoColors.systemYellow,
            border: Border(
              bottom: BorderSide(
                color: brightness == Brightness.light
                    ? CupertinoColors.black
                    : CupertinoColors.white,
              ),
            ),
            middle: const Text('Contacts Group'),
            largeTitle: const Text('Family'),
          ),
          const SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Arrástrame hacia arriba', textAlign: TextAlign.center),
                Text('Toque el botón principal para navegar hacia atrás.',
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
