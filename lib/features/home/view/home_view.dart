
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/colors/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routePath = '/home_view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.kColorWhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.go('/profile');
          },
          icon: const Icon(
            Icons.person,
            color: AppColors.kPrimaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/notification');
            },
            icon: const Icon(
              Icons.notifications,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Home',
          style: TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
