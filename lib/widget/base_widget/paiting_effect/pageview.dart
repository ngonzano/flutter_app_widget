import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget_page.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

/// Flutter code sample for [PageView].

class PageViewExample extends StatefulWidget {
  const PageViewExample({super.key});

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de PageView'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: const ValueKey('PageView'),
        child: const Icon(Icons.code),
        onPressed: () {
          Navigator.push(
              context,
              createFadePageRouteBuilder(
                  page: Scaffold(
                    appBar: AppBar(
                      title: const Text('Ejemplo de ClipOval'),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          HighlightView(
                            '''
body: Stack(
  alignment: Alignment.bottomCenter,
  children: <Widget>[
    PageView(
      controller: _pageViewController,
      onPageChanged: (value) {
        print(value);
        setState(() {
          currentPageIndex = value;
        });
      },
      children: <Widget>[
        Center(
          child: Text('First Page', style: textTheme.titleLarge),
        ),
        Center(
          child: Text('Second Page', style: textTheme.titleLarge),
        ),
        Center(
          child: Text('Third Page', style: textTheme.titleLarge),
        ),
      ],
    ),
  ],
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
                  name: 'PageView'));
        },
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: _pageViewController,
            onPageChanged: (value) {
              print(value);
              setState(() {
                currentPageIndex = value;
              });
            },
            children: <Widget>[
              Center(
                child: Text('First Page', style: textTheme.titleLarge),
              ),
              Center(
                child: Text('Second Page', style: textTheme.titleLarge),
              ),
              Center(
                child: Text('Third Page', style: textTheme.titleLarge),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
