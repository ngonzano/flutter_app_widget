import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/main.dart';
import 'package:flutter_app_widgets/widget/widget_page.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

/// Flutter code sample for [SliverAppBar].

class StretchableSliverAppBar extends StatefulWidget {
  const StretchableSliverAppBar({super.key});

  @override
  State<StretchableSliverAppBar> createState() =>
      _StretchableSliverAppBarState();
}

class _StretchableSliverAppBarState extends State<StretchableSliverAppBar> {
  bool _stretch = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                stretch: _stretch,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.push(
                      context,
                      createFadePageRouteBuilder(
                          page: const HeroMode(enabled: false, child: MyApp()),
                          name: 'RefreshControlApp'),
                    );
                  },
                ),
                onStretchTrigger: () async {},
                stretchTriggerOffset: 300.0,
                expandedHeight: 200.0,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('SliverAppBar'),
                  background: FlutterLogo(),
                ),
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
return MaterialApp(
debugShowCheckedModeBanner: false,
home: Scaffold(
  body: CustomScrollView(
    physics: const BouncingScrollPhysics(),
    slivers: <Widget>[
      SliverAppBar(
        stretch: _stretch,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.push(
              context,
              createFadePageRouteBuilder(
                  page: const HeroMode(enabled: false, child: MyApp()),
                  name: 'RefreshControlApp'),
            );
          },
        ),
        onStretchTrigger: () async {},
        stretchTriggerOffset: 300.0,
        expandedHeight: 200.0,
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('SliverAppBar'),
          background: FlutterLogo(),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              color: index.isOdd ? Colors.white : Colors.black12,
              height: 100.0,
              child: Center(
                child: Text('index',
                    textScaler: const TextScaler.linear(5.0)),
              ),
            );
          },
          childCount: 20,
        ),
      ),
    ],
  ),
  bottomNavigationBar: BottomAppBar(
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: OverflowBar(
        overflowAlignment: OverflowBarAlignment.center,
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('stretch'),
              Switch(
                onChanged: (bool val) {
                  setState(() {
                    _stretch = val;
                  });
                },
                value: _stretch,
              ),
            ],
          ),
        ],
      ),
    ),
  ),
));
                                  
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
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      color: index.isOdd ? Colors.white : Colors.black12,
                      height: 100.0,
                      child: Center(
                        child: Text('$index',
                            textScaler: const TextScaler.linear(5.0)),
                      ),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: OverflowBar(
                overflowAlignment: OverflowBarAlignment.center,
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('stretch'),
                      Switch(
                        onChanged: (bool val) {
                          setState(() {
                            _stretch = val;
                          });
                        },
                        value: _stretch,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
