import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class StreamBuilderExampleApp extends StatelessWidget {
  const StreamBuilderExampleApp({super.key});

  static const Duration delay = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StreamBuilderExample(delay: delay),
    );
  }
}

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({
    required this.delay,
    super.key,
  });

  final Duration delay;

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  late final StreamController<int> _controller = StreamController<int>(
    onListen: () async {
      await Future<void>.delayed(widget.delay);

      if (!_controller.isClosed) {
        _controller.add(1);
      }

      await Future<void>.delayed(widget.delay);

      if (!_controller.isClosed) {
        _controller.close();
      }
    },
  );

  Stream<int> get _bids => _controller.stream;

  @override
  void dispose() {
    if (!_controller.isClosed) {
      _controller.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: Container(
        alignment: FractionalOffset.center,
        color: Colors.white,
        child: BidsStatus(bids: _bids),
      ),
    );
  }
}

class BidsStatus extends StatelessWidget {
  const BidsStatus({
    required this.bids,
    super.key,
  });

  final Stream<int>? bids;

  @override
  Widget build(BuildContext context) {
    const code = '''
  late final StreamController<int> _controller = StreamController<int>(
    onListen: () async {
      await Future<void>.delayed(widget.delay);

      if (!_controller.isClosed) {
        _controller.add(1);
      }

      await Future<void>.delayed(widget.delay);

      if (!_controller.isClosed) {
        _controller.close();
      }
    },
  );

  Stream<int> get _bids => _controller.stream;
//...
StreamBuilder<int>(
      stream: bids,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//...
if (snapshot.hasError)
//...
switch (snapshot.connectionState) {
case ConnectionState.none:
//...
case ConnectionState.waiting:
//...
case ConnectionState.active:
//...
case ConnectionState.done:
//...
}
//...
Text('\${snapshot.data}'),


    ''';

    return SingleChildScrollView(
      child: Column(
        children: [
          HighlightView(
            code,
            language: 'dart', // Especifica que es código Dart
            theme: friendlyTheme,
            padding: const EdgeInsets.all(12.0),
            textStyle: const TextStyle(
              fontFamily: 'Courier', // Fuente monoespaciada
              fontSize: 16.0,
            ),
          ),
          StreamBuilder<int>(
            stream: bids,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              List<Widget> children;
              if (snapshot.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Stack trace: ${snapshot.stackTrace}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ];
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    children = const <Widget>[
                      Icon(
                        Icons.info,
                        color: Colors.blue,
                        size: 60,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Select a lot'),
                      ),
                    ];
                  case ConnectionState.waiting:
                    children = const <Widget>[
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting bids...'),
                      ),
                    ];
                  case ConnectionState.active:
                    children = <Widget>[
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('\$${snapshot.data}'),
                      ),
                    ];
                  case ConnectionState.done:
                    children = <Widget>[
                      const Icon(
                        Icons.info,
                        color: Colors.blue,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          snapshot.hasData
                              ? '\$${snapshot.data} (closed)'
                              : '(closed)',
                        ),
                      ),
                    ];
                }
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              );
            },
          ),
        ],
      ),
    );
  }
}
