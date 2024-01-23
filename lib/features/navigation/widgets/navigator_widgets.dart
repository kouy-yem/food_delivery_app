import 'package:flutter/material.dart';

import '../../../shared/colors/app_colors.dart';


class NavigatorWidgets extends StatelessWidget {
  const NavigatorWidgets({
    super.key,
    required this.text,
    required this.image,
    required this.description});
  final String text;
  final String image;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        SizedBox(height: 10),
        Text(
          text,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color:  AppColors.kColorWhite,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: AppColors.kColorWhite,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
