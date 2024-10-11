import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class SliverVsListViewExample extends StatelessWidget {
  const SliverVsListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: const Text('Sliver vs. ListView'),
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
                                        backgroundColor:
                                            CupertinoColors.systemYellow,
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
SliverFixedExtentList(
  itemExtent: 150.0,
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.lightBlue[100 * (index % 9)],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1),
        ),
        alignment: Alignment.center,
        child: Text('list item index'),
      );
    },
    childCount: 20,
  ),
)
                                  
                                  ''',
                                                language:
                                                    'dart', // Especifica que es código Dart
                                                theme: atomOneDarkTheme,
                                                padding:
                                                    const EdgeInsets.all(2.0),
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
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 4.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.teal[100 * (index % 9)],
                        child: Text('grid item $index'),
                      );
                    },
                    childCount: 21,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return _buildListItem(index,
                          Colors.primaries[index % Colors.primaries.length]);
                    },
                    childCount: 20,
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 150.0,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[100 * (index % 9)],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1),
                        ),
                        alignment: Alignment.center,
                        child: Text('list item $index'),
                      );
                    },
                    childCount: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(int index, Color color) {
    return Container(
      height: 100,
      color: color,
      alignment: Alignment.center,
      child: Text(
        'Item ${index + 1}',
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
