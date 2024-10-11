import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget_page.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class NotificationListenerExample extends StatelessWidget {
  const NotificationListenerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const NotificationListenerPage(),
    );
  }
}

class NotificationListenerPage extends StatefulWidget {
  const NotificationListenerPage({super.key});

  @override
  State<NotificationListenerPage> createState() =>
      _NotificationListenerPageState();
}

class _NotificationListenerPageState extends State<NotificationListenerPage> {
  String message = 'New';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // creating appbar
      appBar: AppBar(
        title: const Text('Ejemplo de NotificationListener'),
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
                      title: const Text('Ejemplo de NotificationListener'),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          HighlightView(
                            '''
Expanded(
  child: NotificationListener<ScrollNotification>(
    onNotification: (scrollNotification) {
      // Logic of scrollNotification
      if (scrollNotification is ScrollStartNotification) {
        setState(() {
          message = 'Scroll Started';
        });
      } else if (scrollNotification is ScrollUpdateNotification) {
        setState(() {
          message = 'Scroll Updated';
        });
      } else if (scrollNotification is ScrollEndNotification) {
        setState(() {
          message = 'Scroll Ended';
        });
      }
      return true;
    },
    // child of type required. Which means its compulsory to pass in NotificationListener
    child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item: index'),
          );
        }),
  ),
)
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
                  name: 'NotificationListener'));
        },
      ),

      // Creating a container and giving it some styling properties
      body: Column(
        children: [
          Container(
            height: 60,
            color: Colors.orangeAccent,
            child: Center(
              child: Text(
                message,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // using NotificationListener Widget
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                // Logic of scrollNotification
                if (scrollNotification is ScrollStartNotification) {
                  setState(() {
                    message = 'Scroll Started';
                  });
                } else if (scrollNotification is ScrollUpdateNotification) {
                  setState(() {
                    message = 'Scroll Updated';
                  });
                } else if (scrollNotification is ScrollEndNotification) {
                  setState(() {
                    message = 'Scroll Ended';
                  });
                }
                return true;
              },
              // child of type required. Which means its compulsory to pass in NotificationListener
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item: $index'),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
