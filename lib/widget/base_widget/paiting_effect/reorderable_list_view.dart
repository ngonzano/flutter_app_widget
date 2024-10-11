import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget_page.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

/// Flutter code sample for [ReorderableListView].

class ReorderableExample extends StatefulWidget {
  const ReorderableExample({super.key});

  @override
  State<ReorderableExample> createState() => _ReorderableListViewExampleState();
}

class _ReorderableListViewExampleState extends State<ReorderableExample> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de ReorderableListView'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: const ValueKey('ReorderableListView'),
        child: const Icon(Icons.code),
        onPressed: () {
          Navigator.push(
              context,
              createFadePageRouteBuilder(
                  page: Scaffold(
                    appBar: AppBar(
                      title: const Text('Ejemplo de ReorderableListView'),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          HighlightView(
                            '''
final List<int> _items = List<int>.generate(50, (int index) => index);
//
body: ReorderableListView(
  padding: const EdgeInsets.symmetric(horizontal: 5),
  children: <Widget>[
    for (int index = 0; index < _items.length; index += 1)
      ListTile(
        key: Key('index'),
        tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
        title: Text('Item {_items[index]}'),
      ),
  ],
  onReorder: (int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final int item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  },
),   
                                  ''',
                            language: 'dart', // Especifica que es código Dart
                            theme: atomOneDarkTheme,
                            padding: const EdgeInsets.all(2.0),
                            textStyle: const TextStyle(
                              fontFamily: 'Courier', // Fuente monoespaciada
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  name: 'Reorderable'));
        },
      ),
      body: ReorderableListView(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        children: <Widget>[
          for (int index = 0; index < _items.length; index += 1)
            ListTile(
              key: Key('$index'),
              tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
              title: Text('Item ${_items[index]}'),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
