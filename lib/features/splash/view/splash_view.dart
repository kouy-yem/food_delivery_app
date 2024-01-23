import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../main/view/main_view.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const routePath = '/';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.go(MainView.routePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        )
      ),
    );
  }
}
