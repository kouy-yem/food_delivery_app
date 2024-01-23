import 'package:flutter/material.dart';
import 'package:food_delivery_app/shared/colors/app_colors.dart';

class ContinueWithWidget extends StatelessWidget {
  const ContinueWithWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Or Continue With',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
              ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.kColorGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/facebook-3.png',
                        width: 40, height: 40
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Facebook',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: AppColors.kColorWhite,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.kColorGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/google-icon.png',
                        width: 40, height: 40
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Google',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: AppColors.kColorWhite,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
