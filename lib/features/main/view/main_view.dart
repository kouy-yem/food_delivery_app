
import 'package:flutter/material.dart';

import '../../home/view/home_view.dart';
import '../../navigation/navigation.dart';

late TabController tabController;

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routePath = '/main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeView(),
        ],
      ),
      bottomNavigationBar: Navigation(tabController: tabController),
    );
  }
}
