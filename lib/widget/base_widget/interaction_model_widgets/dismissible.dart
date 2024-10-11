import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class DismissibleExampleApp extends StatelessWidget {
  const DismissibleExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Dismissible Sample')),
        body: const DismissibleExample(),
      ),
    );
  }
}

class DismissibleExample extends StatefulWidget {
  const DismissibleExample({super.key});

  @override
  State<DismissibleExample> createState() => _DismissibleExampleState();
}

class _DismissibleExampleState extends State<DismissibleExample> {
  List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    const code = '''
child: ListView.builder(
  itemCount: items.length,
  padding: const EdgeInsets.symmetric(vertical: 16),
  itemBuilder: (BuildContext context, int index) {
    return Dismissible(
      background: Container(
        color: Colors.green,
      ),
      key: ValueKey<int>(items[index]),
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          items.removeAt(index);
        }
        setState(() {});
      },
      child: ListTile(
        title: Text(
          'Item items[index]',
        ),
      ),
    );
  },
),
    ''';
    return SingleChildScrollView(
      child: Column(
        children: [
          HighlightView(
            code,
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
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  background: Container(
                    color: Colors.green,
                  ),
                  key: ValueKey<int>(items[index]),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Text(
                      'Item ${items[index]}',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
