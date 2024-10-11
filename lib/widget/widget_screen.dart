import 'package:flutter/material.dart';

class WidgetScreen extends StatelessWidget {
  final TabBar tabBar;
  final String title;
  final TabBarView tabBarView;
  final int length;

  const WidgetScreen(
      {super.key,
      required this.tabBar,
      required this.title,
      required this.tabBarView,
      required this.length});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: length,
        child: Scaffold(
          appBar: AppBar(
            bottom: tabBar,
            title: Text(title),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: tabBarView,
        ),
      ),
    );
  }
}
