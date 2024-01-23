
import 'package:flutter/material.dart';

import '../../navigation/page/navigation_page.dart';

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
      body: NavigatorPage(),
    );
  }
}
