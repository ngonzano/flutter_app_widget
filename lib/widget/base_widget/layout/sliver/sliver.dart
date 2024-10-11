import 'package:flutter/material.dart';
import 'package:flutter_app_widgets/widget/base_widget/base_widget.dart';
import 'package:flutter_app_widgets/widget/base_widget/layout/sliver/cupertino_sliver_navigation_bar.dart';
import 'package:flutter_app_widgets/widget/widget.dart';

class SliverScreen extends StatelessWidget {
  const SliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      enabled: true,
      child: SizedBox(
        width: 300,
        height: 500,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('CupertinoSliverNavigationBar'),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    createFadePageRouteBuilder(
                        page: const CupertinoSliverNavigationBarScreen(),
                        name: 'CupertinoSliverNavigationBarScreen'),
                  );
                },
              ),
              ListTile(
                title: const Text('CupertinoSliverRefreshControl'),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    createFadePageRouteBuilder(
                        page: const RefreshControlApp(),
                        name: 'RefreshControlApp'),
                  );
                },
              ),
              ListTile(
                title: const Text('CustomScrollView'),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    createFadePageRouteBuilder(
                        page: const CustomScrollViewExampleApp(),
                        name: 'CustomScrollView'),
                  );
                },
              ),
              ListTile(
                title: const Text('CustomScrollView'),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    createFadePageRouteBuilder(
                        page: const StretchableSliverAppBar(),
                        name: 'SliverAppBar'),
                  );
                },
              ),
              ListTile(
                title: const Text('CustomScrollView'),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    createFadePageRouteBuilder(
                        page: const StretchableSliverAppBar(),
                        name: 'SliverAppBar'),
                  );
                },
              ),
              ListTile(
                title: const Text('SliverChildListDelegate'),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    createFadePageRouteBuilder(
                        page: const SliverVsListViewExample(),
                        name: 'SliverChildListDelegate'),
                  );
                },
              ),
              ListTile(
                title: const Text('SliverPadding'),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    createFadePageRouteBuilder(
                        page: const SliverPaddingExample(),
                        name: 'SliverPadding'),
                  );
                },
              ),
              ListTile(
                title: const Text('SliverPersistentHeader'),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    createFadePageRouteBuilder(
                        page: const SliverPersistentHeaderExample(),
                        name: 'SliverPersistentHeader'),
                  );
                },
              ),
              ListTile(
                title: const Text('SliverToBoxAdapter'),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    createFadePageRouteBuilder(
                        page: const SliverToBoxAdapterExample(),
                        name: 'SliverToBoxAdapter'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
