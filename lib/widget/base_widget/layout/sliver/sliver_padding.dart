import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class SliverPaddingExample extends StatelessWidget {
  const SliverPaddingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('SliverPadding'),
            actions: [
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
SliverPadding(
  padding: const EdgeInsets.all(16.0), // Padding alrededor del sliver
  sliver: SliverList(
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          height: 100,
          color: Colors.primaries[index % Colors.primaries.length],
          alignment: Alignment.center,
          child: Text('Item index',
              style: const TextStyle(fontSize: 20)),
        );
      },
      childCount: 20, // Número de elementos
    ),
  ),
)
                                  
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
          SliverPadding(
            padding: const EdgeInsets.all(16.0), // Padding alrededor del sliver
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    height: 100,
                    color: Colors.primaries[index % Colors.primaries.length],
                    alignment: Alignment.center,
                    child: Text('Item $index',
                        style: const TextStyle(fontSize: 20)),
                  );
                },
                childCount: 20, // Número de elementos
              ),
            ),
          ),
        ],
      ),
    );
  }
}
