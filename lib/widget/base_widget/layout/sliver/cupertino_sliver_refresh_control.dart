import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/main.dart';
import 'package:flutter_app_widgets/widget/widget_page.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

/// Flutter code sample for [CupertinoSliverRefreshControl].

class RefreshControlApp extends StatelessWidget {
  const RefreshControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: RefreshControlExample(),
    );
  }
}

class RefreshControlExample extends StatefulWidget {
  const RefreshControlExample({super.key});

  @override
  State<RefreshControlExample> createState() => _RefreshControlExampleState();
}

class _RefreshControlExampleState extends State<RefreshControlExample> {
  List<Color> colors = <Color>[
    CupertinoColors.systemYellow,
    CupertinoColors.systemOrange,
    CupertinoColors.systemPink,
  ];
  List<Widget> items = <Widget>[
    Container(color: CupertinoColors.systemPink, height: 100.0),
    Container(color: CupertinoColors.systemOrange, height: 100.0),
    Container(color: CupertinoColors.systemYellow, height: 100.0),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: const Text('CupertinoSliverRefreshControl Sample'),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  createFadePageRouteBuilder(
                      page: const HeroMode(enabled: false, child: MyApp()),
                      name: 'RefreshControlApp'),
                );
              },
              icon: const Icon(CupertinoIcons.arrow_left_circle)),
          trailing: IconButton(
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
/// Flutter code sample for [CupertinoSliverNavigationBar].
/// CupertinoPageScaffold
/// CupertinoNavigationBar
/// CupertinoPageRoute
/// CupertinoPageScaffold
/// CupertinoSliverNavigationBar
/// SliverFillRemaining
/// 
child: CustomScrollView(
  physics: const BouncingScrollPhysics(
    parent: AlwaysScrollableScrollPhysics(),
  ),
  slivers: <Widget>[
    const CupertinoSliverNavigationBar(
      heroTag: ValueKey('RefreshControlExample'),
      largeTitle: Text('Scroll down'),
    ),
    CupertinoSliverRefreshControl(
      onRefresh: () async {
        await Future<void>.delayed(
          const Duration(milliseconds: 1000),
        );
        setState(() {
          items.insert(
            0,
            Container(color: colors[items.length % 3], height: 100.0),
          );
        });
      },
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => items[index],
        childCount: items.length,
      ),
    ),
  ],
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
              icon: const Icon(Icons.arrow_forward_ios_sharp))),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            heroTag: ValueKey('RefreshControlExample'),
            largeTitle: Text('Scroll down'),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await Future<void>.delayed(
                const Duration(milliseconds: 1000),
              );
              setState(() {
                items.insert(
                  0,
                  Container(color: colors[items.length % 3], height: 100.0),
                );
              });
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => items[index],
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
