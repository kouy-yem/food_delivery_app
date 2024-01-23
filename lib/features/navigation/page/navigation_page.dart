import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/navigation/page/second_navigatoin_page.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/colors/app_colors.dart';
import '../../../shared/widgets/app_bottom.dart';
import '../widgets/navigator_widgets.dart';


class NavigatorPage extends StatelessWidget {
  const NavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            NavigatorWidgets(
              text: 'Find your comfort\nFood here',
              image: 'assets/images/illustartion.png',
              description: 'Here You can find a chef or dish for every\n'
                  ' tastes and color. Enjoy!',
            ),
            AppBottom(
              width: 200,
              text: 'Next',
              color: Colors.green[600]!,
              onPressed: () =>
                  context.go(SecondNavigationPage.routePath),
            ),
          ],
        ),
      ),
    );
  }
}
