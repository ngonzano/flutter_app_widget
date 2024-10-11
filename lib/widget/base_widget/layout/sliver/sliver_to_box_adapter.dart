import 'package:flutter/material.dart';

class SliverToBoxAdapterExample extends StatelessWidget {
  const SliverToBoxAdapterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverToBoxAdapter Example'),
      ),
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter para mostrar un widget que no es un Sliver
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Este es un widget normal dentro de un SliverToBoxAdapter',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          // SliverList para mostrar una lista de elementos
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.grey[300],
                  child: Center(
                    child: Text('Item $index'),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
