import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/colors/app_colors.dart';
import '../../../shared/widgets/app_bottom.dart';
import '../../authentication/login/view/login_view.dart';
import '../widgets/navigator_widgets.dart';

class SecondNavigationPage extends StatelessWidget {
  const SecondNavigationPage({super.key});
  static const routePath = '/second_navigation_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            NavigatorWidgets(
              text: 'Food Cam is Where Your\nComfort Food Lives',
              image: 'assets/images/illustration_next.png',
              description: 'Enjoy a fast and smooth food delivery at\n'
                  'your doorstep!',
            ),
            AppBottom(
              width: 200,
              text: 'Next',
              color: Colors.green[600]!,
              onPressed: () =>
                  context.go(LoginView.routePath),
            ),
          ],
        ),
      ),
    );
  }
}
