import 'package:flutter/material.dart';

class LongPressDraggableExample extends StatefulWidget {
  const LongPressDraggableExample({super.key});

  @override
  State<LongPressDraggableExample> createState() =>
      _LongPressDraggableExampleState();
}

class _LongPressDraggableExampleState extends State<LongPressDraggableExample> {
  Color _targetColor = Colors.grey;
  Offset _draggablePosition = const Offset(50.0, 50.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de LongPressDraggable'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: _draggablePosition.dx,
            top: _draggablePosition.dy,
            child: LongPressDraggable<Color>(
              data: Colors.blue,
              feedback: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue.withOpacity(0.5),
              ),
              childWhenDragging: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.grey,
              ),
              onDragEnd: (details) {
                setState(() {
                  _draggablePosition = details.offset;
                });
              },
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Mantén presionado',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: DragTarget<Color>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Container(
                  width: 200.0,
                  height: 200.0,
                  color: _targetColor,
                  child: Center(
                    child: Text(
                      'Arrastra aquí',
                      style: TextStyle(
                        color: _targetColor == Colors.grey
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                );
              },
              onWillAcceptWithDetails: (data) {
                return true;
              },
              onAcceptWithDetails: (detailsData) {
                setState(() {
                  _targetColor = detailsData.data;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
