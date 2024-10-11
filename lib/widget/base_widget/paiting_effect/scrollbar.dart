import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget_page.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

/// Flutter code sample for [RawScrollbar].

class RawScrollbarExampleApp extends StatelessWidget {
  const RawScrollbarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de ScrollBar'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: const ValueKey('ScrollBar'),
        child: const Icon(Icons.code),
        onPressed: () {
          Navigator.push(
              context,
              createFadePageRouteBuilder(
                  page: Scaffold(
                    appBar: AppBar(
                      title: const Text('Ejemplo de ScrollBar'),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          HighlightView(
                            '''
SizedBox(
  width: constraints.maxWidth / 2,
  child: Scrollbar(
    thumbVisibility: true,
    controller: _firstController,
    child: ListView.builder(
        controller: _firstController,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Scrollable 1 : Index index'),
          );
        }),
  )),
SizedBox(
  width: constraints.maxWidth / 2,
  child: Scrollbar(
    thumbVisibility: true,
    child: ListView.builder(
        primary: true,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 50,
              color: index.isEven
                  ? Colors.amberAccent
                  : Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Scrollable 2 : Index index'),
              ));
        }),
  ),
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
                  name: 'ScrollBar'));
        },
      ),
      body: const Center(
        child: RawScrollbarExample(),
      ),
    );
  }
}

class RawScrollbarExample extends StatefulWidget {
  const RawScrollbarExample({super.key});

  @override
  State<RawScrollbarExample> createState() => _RawScrollbarExampleState();
}

class _RawScrollbarExampleState extends State<RawScrollbarExample> {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: <Widget>[
          SizedBox(
              width: constraints.maxWidth / 2,
              child: Scrollbar(
                thumbVisibility: true,
                controller: _firstController,
                child: ListView.builder(
                    controller: _firstController,
                    itemCount: 100,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Scrollable 1 : Index $index'),
                      );
                    }),
              )),
          SizedBox(
            width: constraints.maxWidth / 2,
            child: Scrollbar(
              thumbVisibility: true,
              child: ListView.builder(
                  primary: true,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 50,
                        color: index.isEven
                            ? Colors.amberAccent
                            : Colors.blueAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Scrollable 2 : Index $index'),
                        ));
                  }),
            ),
          ),
        ],
      );
    });
  }
}
