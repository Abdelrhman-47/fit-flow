import 'package:fit_flow/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class AuthSectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthSectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color:AppColors.primaryLight,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(color: AppColors.primaryLight, fontSize: 13),
        ),
      ],
    );
  }
}
