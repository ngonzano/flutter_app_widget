import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget_page.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

/// Flutter code sample for [RefreshIndicator].

class RefreshIndicatorExample extends StatefulWidget {
  const RefreshIndicatorExample({super.key});

  @override
  State<RefreshIndicatorExample> createState() =>
      _RefreshIndicatorExampleState();
}

class _RefreshIndicatorExampleState extends State<RefreshIndicatorExample> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de Refresh Indicator'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: const ValueKey('ClipOval'),
        child: const Icon(Icons.code),
        onPressed: () {
          Navigator.push(
              context,
              createFadePageRouteBuilder(
                  page: Scaffold(
                    appBar: AppBar(
                      title: const Text('Ejemplo de Refresh Indicator'),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          HighlightView(
                            '''
final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
//
body: RefreshIndicator(
  key: _refreshIndicatorKey,
  color: Colors.white,
  backgroundColor: Colors.blue,
  strokeWidth: 4.0,
  onRefresh: () async {
    return await Future<void>.delayed(
      const Duration(
        seconds: 2,
      ),
    );
  },
  child: ListView.builder(
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text('Item index'),
      );
    },
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
                  name: 'RefreshIndicator'));
        },
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Colors.white,
        backgroundColor: Colors.blue,
        strokeWidth: 4.0,
        onRefresh: () async {
          return await Future<void>.delayed(
            const Duration(
              seconds: 2,
            ),
          );
        },
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     _refreshIndicatorKey.currentState?.show();
      //   },
      //   icon: const Icon(Icons.refresh),
      //   label: const Text('Show Indicator'),
      // ),
    );
  }
}
