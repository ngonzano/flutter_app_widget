import 'package:flutter/material.dart';

import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class MultiChildWidget extends StatelessWidget {
  const MultiChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HighlightView(
              '''
investigar MultiChildLayoutDelegate, CustomMultiChildLayout
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 300,
              child: CustomMultiChildLayoutExample(),
            ),
            HighlightView(
              '''
return Center(
  child: ConstrainedBox(
    constraints: const BoxConstraints(maxHeight: 200),
    child: CarouselView(
      controller: CarouselController(initialItem: 0),
      itemExtent: 330,
      shrinkExtent: 100,
      children: List<Widget>.generate(20, (int index) {
        return UncontainedLayoutCard(index: index, label: 'Item index');
      }),
    ),
  ),
);
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
                width: double.infinity,
                height: 300,
                child: CarouselExampleApp()),
            HighlightView(
              '''
FlowDelegate, State<FlowMenu>, Flow
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
                width: double.infinity, height: 300, child: FlowApp()),
            HighlightView(
              '''
IndexedStack(
  // Index of the child to display
  index: _currentIndex,
  children: [
    // Child 1
    Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Child 1',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    ),
    // Child 2
    Container(
      width: 200,
      height: 200,
      color: Colors.green,
      child: const Center(
        child: Text(
          'Child 2',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    ),
  ],
)
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
                width: double.infinity,
                height: 400,
                child: IndexedStackExample()),
            HighlightView(
              '''
para casos simples es muy ligero en vez de column o listview
ListBody(
  children: <Widget>[
    Text('Elemento 1'),
    Text('Elemento 2'),
    Text('Elemento 3'),
  ],
),
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            const Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ListBody vertical (por defecto)
                    ListBody(
                      mainAxis: Axis.vertical,
                      children: <Widget>[
                        Text('Elemento 1'),
                        Text('Elemento 2'),
                        Text('Elemento 3'),
                        Text('Elemento 1'),
                        Text('Elemento 2'),
                        Text('Elemento 3'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            HighlightView(
              '''
Wrap(
  spacing: 8.0, // gap between adjacent chips
  runSpacing: 2.0, // gap between lines
  children: <Widget>[
    Chip(
      avatar: CircleAvatar(
          backgroundColor: Colors.blue.shade900,
          child: const Text('AH')),
      label: const Text('Hamilton'),
    ),
    Chip(
      avatar: CircleAvatar(
          backgroundColor: Colors.blue.shade900,
          child: const Text('ML')),
      label: const Text('Lafayette'),
    ),
  ],
)
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 2.0, // gap between lines
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900,
                      child: const Text('AH')),
                  label: const Text('Hamilton'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900,
                      child: const Text('ML')),
                  label: const Text('Lafayette'),
                ),
              ],
            ),
            HighlightView(
              '''
return Table(
  border: TableBorder.all(),
  columnWidths: const <int, TableColumnWidth>{
    0: IntrinsicColumnWidth(),
    1: FlexColumnWidth(),
    2: FixedColumnWidth(64),
  },
  defaultVerticalAlignment: TableCellVerticalAlignment.top,
  children: <TableRow>[
    TableRow(
      children: <Widget>[
        Container(
          height: 32,
          color: Colors.green,
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.bottom,
          child: Container(
            height: 32,
            width: 32,
            color: Colors.red,
          ),
        ),
        Container(
          height: 64,
          color: Colors.blue,
        ),
      ],
    ),
    TableRow(
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      children: <Widget>[
        Container(
          height: 64,
          width: 128,
          color: Colors.purple,
        ),
        Container(
          height: 32,
          color: Colors.yellow,
        ),
        Center(
          child: Container(
            height: 32,
            width: 32,
            color: Colors.orange,
          ),
        ),
      ],
    ),
  ],
)
''',
              language: 'dart', // Especifica que es código Dart
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.all(12.0),
              textStyle: const TextStyle(
                fontFamily: 'Courier', // Fuente monoespaciada
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 400,
              child: TableExampleApp(),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

/// Flutter code sample for [Table].

class TableExampleApp extends StatelessWidget {
  const TableExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Table Sample')),
        body: const TableExample(),
      ),
    );
  }
}

class TableExample extends StatelessWidget {
  const TableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(64),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
              height: 32,
              color: Colors.green,
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.bottom,
              child: Container(
                height: 32,
                width: 32,
                color: Colors.red,
              ),
            ),
            Container(
              height: 64,
              color: Colors.blue,
            ),
          ],
        ),
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          children: <Widget>[
            Container(
              height: 64,
              width: 128,
              color: Colors.purple,
            ),
            Container(
              height: 32,
              color: Colors.yellow,
            ),
            Center(
              child: Container(
                height: 32,
                width: 32,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/////IndexedStack/////

class IndexedStackExample extends StatefulWidget {
  const IndexedStackExample({super.key});

  @override
  IndexedStackExampleState createState() => IndexedStackExampleState();
}

class IndexedStackExampleState extends State<IndexedStackExample> {
  // Index to control which child to display
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndexedStack Example'),
      ),
      body: Column(
        children: [
          // Buttons to switch between children
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Show the first child
                    _currentIndex = 0;
                  });
                },
                child: const Text('Child 1'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Show the second child
                    _currentIndex = 1;
                  });
                },
                child: const Text('Child 2'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // IndexedStack to display children
          IndexedStack(
            // Index of the child to display
            index: _currentIndex,
            children: [
              // Child 1
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Child 1',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Child 2
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.blue,
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: 200,
                height: 200,
                child: const Center(
                  child: Text(
                    'Child 2',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Flutter code sample for [Flow].

class FlowApp extends StatelessWidget {
  const FlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flow Example'),
        ),
        body: const FlowMenu(),
      ),
    );
  }
}

class FlowMenu extends StatefulWidget {
  const FlowMenu({super.key});

  @override
  State<FlowMenu> createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    }
  }

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  Widget flowMenuItem(IconData icon) {
    final double buttonDiameter =
        MediaQuery.of(context).size.width / menuItems.length;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 2),
      child: RawMaterialButton(
        fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber[100],
        shape: const CircleBorder(),
        constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
        onPressed: () {
          _updateMenu(icon);
          menuAnimation.status == AnimationStatus.completed
              ? menuAnimation.reverse()
              : menuAnimation.forward();
        },
        child: Icon(
          icon,
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
      children:
          menuItems.map<Widget>((IconData icon) => flowMenuItem(icon)).toList(),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      dx = context.getChildSize(i)!.width * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          dx * menuAnimation.value,
          0,
          0,
        ),
      );
    }
  }
}

//////////CustomMultiChildLayout/////////
class _CascadeLayoutDelegate extends MultiChildLayoutDelegate {
  _CascadeLayoutDelegate({
    required this.colors,
    required this.overlap,
    required this.textDirection,
  });

  final Map<String, Color> colors;
  final double overlap;
  final TextDirection textDirection;

  @override
  void performLayout(Size size) {
    final double columnWidth = size.width / colors.length;
    Offset childPosition = Offset.zero;
    switch (textDirection) {
      case TextDirection.rtl:
        childPosition += Offset(size.width, 0);
      case TextDirection.ltr:
        break;
    }
    for (final String color in colors.keys) {
      final Size currentSize = layoutChild(
        color,
        BoxConstraints(maxHeight: size.height, maxWidth: columnWidth),
      );

      switch (textDirection) {
        case TextDirection.rtl:
          positionChild(color, childPosition - Offset(currentSize.width, 0));
          childPosition +=
              Offset(-currentSize.width, currentSize.height - overlap);
        case TextDirection.ltr:
          positionChild(color, childPosition);
          childPosition +=
              Offset(currentSize.width, currentSize.height - overlap);
      }
    }
  }

  @override
  bool shouldRelayout(_CascadeLayoutDelegate oldDelegate) {
    return oldDelegate.textDirection != textDirection ||
        oldDelegate.overlap != overlap;
  }
}

class CustomMultiChildLayoutExample extends StatelessWidget {
  const CustomMultiChildLayoutExample({super.key});

  static const Map<String, Color> _colors = <String, Color>{
    'Red': Colors.red,
    'Green': Colors.green,
    'Blue': Colors.blue,
    'Cyan': Colors.cyan,
  };

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: _CascadeLayoutDelegate(
        colors: _colors,
        overlap: 30.0,
        textDirection: Directionality.of(context),
      ),
      children: <Widget>[
        for (final MapEntry<String, Color> entry in _colors.entries)
          LayoutId(
            id: entry.key,
            child: Container(
              color: entry.value,
              width: 100.0,
              height: 100.0,
              alignment: Alignment.center,
              child: Text(entry.key),
            ),
          ),
      ],
    );
  }
}
//////////CarouselView/////////

class CarouselExampleApp extends StatelessWidget {
  const CarouselExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Carousel Sample'),
        ),
        body: const CarouselExample(),
      ),
    );
  }
}

class CarouselExample extends StatefulWidget {
  const CarouselExample({super.key});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: CarouselView(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          controller: CarouselController(initialItem: 0),
          itemExtent: 330,
          shrinkExtent: 100,
          children: List<Widget>.generate(20, (int index) {
            return UncontainedLayoutCard(index: index, label: 'Item $index');
          }),
        ),
      ),
    );
  }
}

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({
    super.key,
    required this.index,
    required this.label,
  });

  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          overflow: TextOverflow.clip,
          softWrap: false,
        ),
      ),
    );
  }
}
