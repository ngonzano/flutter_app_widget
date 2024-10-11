import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/main.dart';
import 'package:flutter_app_widgets/widget/widget_page.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class SliverPersistentHeaderExample extends StatefulWidget {
  const SliverPersistentHeaderExample({super.key});

  @override
  State<SliverPersistentHeaderExample> createState() =>
      _SliverPersistentHeaderExampleState();
}

class _SliverPersistentHeaderExampleState
    extends State<SliverPersistentHeaderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            pinned: true, // Mantener el encabezado fijo en la parte superior
            floating:
                true, // Permitir que el encabezado flote sobre el contenido
            delegate: _SliverAppBarDelegate(
              minHeight: 60.0, // Altura mínima del encabezado
              maxHeight: 120.0, // Altura máxima del encabezado
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 100,
                  color: Colors.primaries[index % Colors.primaries.length],
                  alignment: Alignment.center,
                  child: Text('Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;

  const _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  createFadePageRouteBuilder(
                      page: const MyApp(),
                      name: 'CupertinoSliverNavigationBar'),
                );
              },
              icon: const Icon(CupertinoIcons.arrow_left_circle)),
          const Text(
            'Encabezado',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          IconButton(
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
                                bottom:
                                    BorderSide(color: CupertinoColors.black),
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
return Scaffold(
  body: CustomScrollView(
    slivers: [
      const SliverPersistentHeader(
        pinned: true, // Mantener el encabezado fijo en la parte superior
        floating:
            true, // Permitir que el encabezado flote sobre el contenido
        delegate: _SliverAppBarDelegate(
          minHeight: 60.0, // Altura mínima del encabezado
          maxHeight: 120.0, // Altura máxima del encabezado
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              height: 100,
              color: Colors.primaries[index % Colors.primaries.length],
              alignment: Alignment.center,
              child: Text('Item index'),
            );
          },
          childCount: 20,
        ),
      ),
    ],
  ),
);                      
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
              icon: const Icon(Icons.code))
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}
