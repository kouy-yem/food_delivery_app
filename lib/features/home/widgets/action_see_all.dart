import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../../../shared/colors/app_colors.dart';

class ActionSeeAll extends StatelessWidget {
  const ActionSeeAll({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            PhosphorIcons.clock,
            color: AppColors.kColorGrey,
            size: 24,
          ),
          SizedBox(width: 5),
          Text(
            'Order History',
            style: TextStyle(
              color: AppColors.kColorGrey,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: onPressed,
            child: Text(
              'See All',
              style: TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
