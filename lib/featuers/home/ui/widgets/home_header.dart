import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
              style: AppTextStyles.heading2Dark.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Let's get to work.",
              style: AppTextStyles.bodyMedium,
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_outlined, color: AppColors.textDark),
        ),
      ],
    );
  }
}
